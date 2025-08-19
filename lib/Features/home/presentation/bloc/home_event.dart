import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';

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
