import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

abstract class AddExpenseEvent extends Equatable {
  const AddExpenseEvent();

  @override
  List<Object?> get props => [];
}

class LoadCurrenciesRequested extends AddExpenseEvent {
  const LoadCurrenciesRequested();
}

class FormFieldUpdated extends AddExpenseEvent {
  final String? category;
  final Map<String, num>? currency;
  final DateTime? date;
  final CategoryIconData? selectedIconData;
  final File? imageFile;
  final File? file;

  const FormFieldUpdated({
    this.category,
    this.currency,
    this.date,
    this.selectedIconData,
    this.imageFile,
    this.file,
  });

  @override
  List<Object?> get props => [
    category,
    currency,
    date,
    selectedIconData,
    imageFile,
    file,
  ];
}

class ValidateForm extends AddExpenseEvent {
  const ValidateForm();
}

class SaveExpenseRequested extends AddExpenseEvent {
  const SaveExpenseRequested();

  @override
  List<Object?> get props => [];
}
