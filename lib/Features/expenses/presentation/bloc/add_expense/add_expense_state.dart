import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/Features/expenses/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

enum CurrenciesStatus { initial, loading, loaded, error }

class AddExpenseState extends Equatable {
  final CurrenciesStatus currenciesStatus;
  final ExchangeRatesEntity? currencies;
  final String? currenciesError;

  final TextEditingController amountController;
  final File? imageFile;
  final File? file;
  final String? category;
  final Map<String, num>? currency;
  final DateTime? date;
  final CategoryIconData? selectedIconData;
  final bool isFormValid;

  const AddExpenseState({
    this.currenciesStatus = CurrenciesStatus.initial,
    this.currencies,
    this.currenciesError,
    required this.amountController,
    this.imageFile,
    this.file,
    this.category,
    this.currency,
    this.date,
    this.selectedIconData,
    this.isFormValid = false,
  });

  AddExpenseState.initial() : this(amountController: TextEditingController());

  AddExpenseState copyWith({
    CurrenciesStatus? currenciesStatus,
    ExchangeRatesEntity? currencies,
    String? currenciesError,
    TextEditingController? amountController,
    File? imageFile,
    File? file,
    String? category,
    Map<String, num>? currency,
    DateTime? date,
    CategoryIconData? selectedIconData,
    bool? isFormValid,
  }) {
    return AddExpenseState(
      currenciesStatus: currenciesStatus ?? this.currenciesStatus,
      currencies: currencies ?? this.currencies,
      currenciesError: currenciesError ?? this.currenciesError,
      amountController: amountController ?? this.amountController,
      imageFile: imageFile ?? this.imageFile,
      file: file ?? this.file,
      category: category ?? this.category,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      selectedIconData: selectedIconData ?? this.selectedIconData,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  // Get form data for saving
  Map<String, dynamic>? getFormData() {
    if (!isFormValid) return null;

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

  @override
  List<Object?> get props => [
    currenciesStatus,
    currencies,
    currenciesError,
    amountController,
    imageFile,
    file,
    category,
    currency,
    date,
    selectedIconData,
    isFormValid,
  ];

  @override
  String toString() {
    return 'AddExpenseState('
        'currenciesStatus: $currenciesStatus, '
        'isFormValid: $isFormValid'
        ')';
  }
}
