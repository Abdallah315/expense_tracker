import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/widgets/categories_drop_down_widget.dart';
import 'package:inovola_task/Features/home/presentation/widgets/categories_icon_widget.dart';
import 'package:inovola_task/Features/home/presentation/widgets/currency_drop_down.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/app_text_form_field.dart';
import 'package:inovola_task/core/widgets/app_date_picker.dart';
import 'package:inovola_task/core/widgets/app_upload_options.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late TextEditingController amountController;

  final ValueNotifier<File?> imageFileNotifier = ValueNotifier<File?>(null);
  final ValueNotifier<File?> fileNotifier = ValueNotifier<File?>(null);
  final ValueNotifier<String?> categoryNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<Map<String, num>?> currencyNotifier =
      ValueNotifier<Map<String, num>?>(null);
  final ValueNotifier<DateTime?> dateNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<CategoryIconData?> selectedIconDataNotifier =
      ValueNotifier<CategoryIconData?>(null);

  final ValueNotifier<bool> _formValidationNotifier = ValueNotifier<bool>(
    false,
  );

  @override
  void initState() {
    super.initState();
    initData();
    _addListeners();
  }

  void initData() {
    context.read<HomeBloc>().add(const LoadCurrenciesRequested());
  }

  void _addListeners() {
    amountController = TextEditingController();
    amountController.addListener(_updateFormValidation);
    imageFileNotifier.addListener(_updateFormValidation);
    fileNotifier.addListener(_updateFormValidation);
    categoryNotifier.addListener(_updateFormValidation);
    currencyNotifier.addListener(_updateFormValidation);
    dateNotifier.addListener(_updateFormValidation);
    selectedIconDataNotifier.addListener(_updateFormValidation);
  }

  @override
  void dispose() {
    amountController.dispose();
    imageFileNotifier.dispose();
    fileNotifier.dispose();
    categoryNotifier.dispose();
    currencyNotifier.dispose();
    dateNotifier.dispose();
    selectedIconDataNotifier.dispose();
    _formValidationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense'), centerTitle: true),
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            CategoriesDropDownWidget(
              onCategorySelected: (category) {
                categoryNotifier.value = category;
              },
            ),
            verticalSpace(16),
            Text('Amount', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppTextFormField(
              controller: amountController,
              hintText: '0',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                if (double.tryParse(value) == null) {
                  return 'Amount must be a number';
                }
                return null;
              },
            ),
            verticalSpace(16),
            Text('Currency', style: TextStyles.font16MediumBlack),
            CurrencyDropdown(
              onCurrencySelected: (currency) {
                currencyNotifier.value = currency;
              },
            ),
            verticalSpace(16),
            Text('Date', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppDatePicker(
              hintText: '02/01/24',
              onDateSelected: (DateTime? date) {
                dateNotifier.value = date;
              },
            ),
            verticalSpace(16),
            Text('Attach Receipt', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppUploadOptions(
              onImageUpload: (File imageFile) {
                imageFileNotifier.value = imageFile;
              },
              onFileUpload: (File file) {
                fileNotifier.value = file;
              },
            ),
            verticalSpace(24),
            Text('Category icon', style: TextStyles.font16MediumBlack),
            verticalSpace(12),
            CategoriesIconWidget(
              onIconSelected: (CategoryIconData iconData) {
                selectedIconDataNotifier.value = iconData;
              },
            ),
            verticalSpace(32),
            // Reactive save button that listens to all form field changes
            ValueListenableBuilder<bool>(
              valueListenable: _formValidationNotifier,
              builder: (context, isValid, child) {
                return SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: isValid ? save : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool canSave() {
    return amountController.text.isNotEmpty &&
        double.tryParse(amountController.text) != null &&
        categoryNotifier.value != null &&
        currencyNotifier.value != null &&
        dateNotifier.value != null &&
        selectedIconDataNotifier.value != null;
  }

  void save() {
    final amount = double.parse(amountController.text);
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(
      SaveExpenseRequested(
        iconData: selectedIconDataNotifier.value!,
        category: categoryNotifier.value!,
        amount: amount,
        currency: currencyNotifier.value!,
        date: dateNotifier.value!,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Expense saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    context.pop();
  }

  void _updateFormValidation() {
    final isValid =
        amountController.text.isNotEmpty &&
        double.tryParse(amountController.text) != null &&
        categoryNotifier.value != null &&
        currencyNotifier.value != null &&
        dateNotifier.value != null &&
        selectedIconDataNotifier.value != null;

    _formValidationNotifier.value = isValid;
  }
}
