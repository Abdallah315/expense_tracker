import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_home_expenses.dart';

enum SummaryStatus { initial, loading, loaded, error }

enum ExpensesStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final SummaryStatus summaryStatus;
  final ExpensesStatus expensesStatus;

  final ExpensesSummaryEntity? summary;
  final List<ExpenseEntity>? expenses;

  final DateFilter currentFilter;

  final String? summaryError;
  final String? expensesError;

  const HomeState({
    this.summaryStatus = SummaryStatus.initial,
    this.expensesStatus = ExpensesStatus.initial,
    this.summary,
    this.expenses,
    this.currentFilter = DateFilter.all,
    this.summaryError,
    this.expensesError,
  });

  const HomeState.initial() : this();

  HomeState copyWith({
    SummaryStatus? summaryStatus,
    ExpensesStatus? expensesStatus,
    ExpensesSummaryEntity? summary,
    List<ExpenseEntity>? expenses,
    DateFilter? currentFilter,
    String? summaryError,
    String? expensesError,
    String? currenciesError,
  }) {
    return HomeState(
      summaryStatus: summaryStatus ?? this.summaryStatus,
      expensesStatus: expensesStatus ?? this.expensesStatus,
      summary: summary ?? this.summary,
      expenses: expenses ?? this.expenses,
      currentFilter: currentFilter ?? this.currentFilter,
      summaryError: summaryError ?? this.summaryError,
      expensesError: expensesError ?? this.expensesError,
    );
  }

  @override
  List<Object?> get props => [
    summaryStatus,
    expensesStatus,
    summary,
    expenses,
    currentFilter,
    summaryError,
    expensesError,
  ];

  @override
  String toString() {
    return 'HomeState('
        'summaryStatus: $summaryStatus, '
        'expensesStatus: $expensesStatus, '
        'currentFilter: $currentFilter, '
        ')';
  }
}
