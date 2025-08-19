import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeDataRequested extends HomeEvent {
  const LoadHomeDataRequested();
}

class LoadMoreExpensesRequested extends HomeEvent {
  const LoadMoreExpensesRequested();
}

class FilterChangedEvent extends HomeEvent {
  final DateFilter filter;

  const FilterChangedEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

class LoadCurrenciesRequested extends HomeEvent {
  const LoadCurrenciesRequested();
}

class SaveExpenseRequested extends HomeEvent {
  final CategoryIconData iconData;
  final String category;
  final double amount;
  final String currency;
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
