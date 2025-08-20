import 'package:equatable/equatable.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';

enum ExpensesStatus { initial, loading, loaded, loadingMore, error }

class ExpensesState extends Equatable {
  final ExpensesStatus expensesStatus;

  final List<ExpenseEntity>? expenses;

  final int currentPage;
  final bool hasMoreExpenses;

  final String? expensesError;

  const ExpensesState({
    this.expensesStatus = ExpensesStatus.initial,
    this.expenses,
    this.currentPage = 1,
    this.hasMoreExpenses = false,
    this.expensesError,
  });

  const ExpensesState.initial() : this();

  ExpensesState copyWith({
    ExpensesStatus? expensesStatus,
    List<ExpenseEntity>? expenses,
    int? currentPage,
    bool? hasMoreExpenses,
    String? expensesError,
  }) {
    return ExpensesState(
      expensesStatus: expensesStatus ?? this.expensesStatus,
      expenses: expenses ?? this.expenses,
      currentPage: currentPage ?? this.currentPage,
      hasMoreExpenses: hasMoreExpenses ?? this.hasMoreExpenses,
      expensesError: expensesError ?? this.expensesError,
    );
  }

  @override
  List<Object?> get props => [
    expensesStatus,
    expenses,
    currentPage,
    hasMoreExpenses,
    expensesError,
  ];

  @override
  String toString() {
    return 'ExpensesState('
        'expensesStatus: $expensesStatus, '
        'currentPage: $currentPage, '
        'hasMoreExpenses: $hasMoreExpenses'
        ')';
  }
}
