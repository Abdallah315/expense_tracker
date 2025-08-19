import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    homeBloc = getIt<HomeBloc>();
    homeBloc.add(const LoadCurrenciesRequested());
  }

  File? imageFile;
  File? file;
  String? category;
  Map<String, int>? currency;
  DateTime? date;
  CategoryIconData? selectedIconData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: homeBloc,
      child: Scaffold(
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
                  this.category = category;
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
                  this.currency = currency;
                },
              ),
              verticalSpace(16),
              Text('Date', style: TextStyles.font16MediumBlack),
              verticalSpace(8),
              AppDatePicker(
                hintText: '02/01/24',
                onDateSelected: (DateTime? date) {
                  this.date = date;
                },
              ),
              verticalSpace(16),
              Text('Attach Receipt', style: TextStyles.font16MediumBlack),
              verticalSpace(8),
              AppUploadOptions(
                onImageUpload: (File imageFile) {
                  this.imageFile = imageFile;
                },
                onFileUpload: (File file) {
                  this.file = file;
                },
              ),
              verticalSpace(24),
              Text('Category icon', style: TextStyles.font16MediumBlack),
              verticalSpace(12),
              CategoriesIconWidget(
                onIconSelected: (CategoryIconData iconData) {
                  selectedIconData = iconData;
                },
              ),
              verticalSpace(32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: canSave() ? save : null,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool canSave() {
    return amountController.text.isNotEmpty &&
        double.tryParse(amountController.text) != null &&
        category != null &&
        currency != null &&
        date != null &&
        selectedIconData != null;
  }

  void save() {
    if (!canSave()) return;

    final amount = double.parse(amountController.text);

    homeBloc.add(
      SaveExpenseRequested(
        iconData: selectedIconData!,
        category: category!,
        amount: amount,
        currency: currency!,
        date: date!,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Expense saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.of(context).pop();
  }
}
