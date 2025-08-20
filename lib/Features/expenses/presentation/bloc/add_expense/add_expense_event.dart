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

class SaveExpenseRequested extends AddExpenseEvent {
  final CategoryIconData iconData;
  final String category;
  final double amount;
  final Map<String, num> currency;
  final DateTime date;

  const SaveExpenseRequested({
    required this.iconData,
    required this.category,
    required this.amount,
    required this.currency,
    required this.date,
  });

  @override
  List<Object?> get props => [iconData, category, amount, currency, date];
}
