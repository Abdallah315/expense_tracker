import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

// Form State
class AddExpenseFormState {
  final TextEditingController amountController;
  final File? imageFile;
  final File? file;
  final String? category;
  final Map<String, num>? currency;
  final DateTime? date;
  final CategoryIconData? selectedIconData;
  final bool isValid;

  const AddExpenseFormState({
    required this.amountController,
    this.imageFile,
    this.file,
    this.category,
    this.currency,
    this.date,
    this.selectedIconData,
    required this.isValid,
  });

  AddExpenseFormState copyWith({
    TextEditingController? amountController,
    File? imageFile,
    File? file,
    String? category,
    Map<String, num>? currency,
    DateTime? date,
    CategoryIconData? selectedIconData,
    bool? isValid,
  }) {
    return AddExpenseFormState(
      amountController: amountController ?? this.amountController,
      imageFile: imageFile ?? this.imageFile,
      file: file ?? this.file,
      category: category ?? this.category,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      selectedIconData: selectedIconData ?? this.selectedIconData,
      isValid: isValid ?? this.isValid,
    );
  }

  Map<String, dynamic>? getFormData() {
    if (!isValid) return null;

    return {
      'amount': double.parse(amountController.text),
      'category': category!,
      'currency': currency!,
      'date': date!,
      'iconData': selectedIconData!,
      'imageFile': imageFile,
      'file': file,
    };
  }
}

// Form Cubit
class AddExpenseFormCubit extends Cubit<AddExpenseFormState> {
  AddExpenseFormCubit()
    : super(
        AddExpenseFormState(
          amountController: TextEditingController(),
          isValid: false,
        ),
      ) {
    state.amountController.addListener(_validateForm);
  }

  // Setters
  void setImageFile(File? file) {
    emit(state.copyWith(imageFile: file));
    _validateForm();
  }

  void setFile(File? file) {
    emit(state.copyWith(file: file));
    _validateForm();
  }

  void setCategory(String? category) {
    emit(state.copyWith(category: category));
    _validateForm();
  }

  void setCurrency(Map<String, num>? currency) {
    emit(state.copyWith(currency: currency));
    _validateForm();
  }

  void setDate(DateTime? date) {
    emit(state.copyWith(date: date));
    _validateForm();
  }

  void setSelectedIconData(CategoryIconData? iconData) {
    emit(state.copyWith(selectedIconData: iconData));
    _validateForm();
  }

  // Validation
  void _validateForm() {
    final isValid =
        state.amountController.text.isNotEmpty &&
        double.tryParse(state.amountController.text) != null &&
        state.category != null &&
        state.currency != null &&
        state.date != null &&
        state.selectedIconData != null;

    emit(state.copyWith(isValid: isValid));
  }

  // Reset form
  void reset() {
    state.amountController.clear();
    emit(
      AddExpenseFormState(
        amountController: state.amountController,
        isValid: false,
      ),
    );
  }

  @override
  Future<void> close() {
    state.amountController.dispose();
    return super.close();
  }
}
