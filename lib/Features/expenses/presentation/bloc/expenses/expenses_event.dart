import 'package:equatable/equatable.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class LoadMoreExpensesRequested extends ExpensesEvent {
  const LoadMoreExpensesRequested();
}

class LoadFullExpensesRequested extends ExpensesEvent {
  const LoadFullExpensesRequested();
}
