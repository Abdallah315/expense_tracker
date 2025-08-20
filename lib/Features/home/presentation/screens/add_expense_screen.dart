import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/cubit/add_expense_form_cubit.dart';
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
  late final AddExpenseFormCubit _formCubit;

  @override
  void initState() {
    super.initState();
    _formCubit = getIt<AddExpenseFormCubit>();
    context.read<HomeBloc>().add(const LoadCurrenciesRequested());
  }

  @override
  void dispose() {
    _formCubit.close();
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
                _formCubit.setCategory(category);
              },
            ),
            verticalSpace(16),
            Text('Amount', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppTextFormField(
              controller: _formCubit.state.amountController,
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
                _formCubit.setCurrency(currency);
              },
            ),
            verticalSpace(16),
            Text('Date', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppDatePicker(
              hintText: '02/01/24',
              onDateSelected: (DateTime? date) {
                _formCubit.setDate(date);
              },
            ),
            verticalSpace(16),
            Text('Attach Receipt', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppUploadOptions(
              onImageUpload: (File imageFile) {
                _formCubit.setImageFile(imageFile);
              },
              onFileUpload: (File file) {
                _formCubit.setFile(file);
              },
            ),
            verticalSpace(24),
            Text('Category icon', style: TextStyles.font16MediumBlack),
            verticalSpace(12),
            CategoriesIconWidget(
              onIconSelected: (CategoryIconData iconData) {
                _formCubit.setSelectedIconData(iconData);
              },
            ),
            verticalSpace(32),
            BlocBuilder<AddExpenseFormCubit, AddExpenseFormState>(
              bloc: _formCubit,
              builder: (context, state) {
                final isValid = state.isValid;
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

  void save() {
    final formData = _formCubit.state.getFormData();
    if (formData == null) return;

    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(
      SaveExpenseRequested(
        iconData: formData['iconData'] as CategoryIconData,
        category: formData['category'] as String,
        amount: formData['amount'] as double,
        currency: formData['currency'] as Map<String, num>,
        date: formData['date'] as DateTime,
      ),
    );

    context.pop();
  }
}
