import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_bloc.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_event.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_state.dart';
import 'package:inovola_task/Features/expenses/presentation/widgets/categories_drop_down_widget.dart';
import 'package:inovola_task/Features/expenses/presentation/widgets/categories_icon_widget.dart';
import 'package:inovola_task/Features/expenses/presentation/widgets/currency_drop_down.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<AddExpenseBloc>().add(const LoadCurrenciesRequested());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addExpenseBloc = context.read<AddExpenseBloc>();
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
                addExpenseBloc.add(FormFieldUpdated(category: category));
              },
            ),
            verticalSpace(16),
            Text('Amount', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppTextFormField(
              controller: addExpenseBloc.state.amountController,
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
                addExpenseBloc.add(FormFieldUpdated(currency: currency));
              },
            ),
            verticalSpace(16),
            Text('Date', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppDatePicker(
              hintText: '02/01/24',
              onDateSelected: (DateTime? date) {
                addExpenseBloc.add(FormFieldUpdated(date: date));
              },
            ),
            verticalSpace(16),
            Text('Attach Receipt', style: TextStyles.font16MediumBlack),
            verticalSpace(8),
            AppUploadOptions(
              onImageUpload: (File imageFile) {
                addExpenseBloc.add(FormFieldUpdated(imageFile: imageFile));
              },
              onFileUpload: (File file) {
                addExpenseBloc.add(FormFieldUpdated(file: file));
              },
            ),
            verticalSpace(24),
            Text('Category icon', style: TextStyles.font16MediumBlack),
            verticalSpace(12),
            CategoriesIconWidget(
              onIconSelected: (CategoryIconData iconData) {
                addExpenseBloc.add(
                  FormFieldUpdated(selectedIconData: iconData),
                );
              },
            ),
            verticalSpace(32),
            BlocBuilder<AddExpenseBloc, AddExpenseState>(
              buildWhen: (previous, current) =>
                  previous.isFormValid != current.isFormValid,
              bloc: addExpenseBloc,
              builder: (context, state) {
                final isValid = state.isFormValid;
                return SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: isValid ? () => save(addExpenseBloc) : null,
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

  void save(AddExpenseBloc formCubit) {
    final formData = formCubit.state.getFormData();
    if (formData == null) return;

    final addExpenseBloc = BlocProvider.of<AddExpenseBloc>(context);
    addExpenseBloc.add(SaveExpenseRequested());

    context.pop(true);
  }
}
