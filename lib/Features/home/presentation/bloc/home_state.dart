import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';

enum SummaryStatus { initial, loading, loaded, error }

enum ExpensesStatus { initial, loading, loaded, loadingMore, error }

enum CurrenciesStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final SummaryStatus summaryStatus;
  final ExpensesStatus expensesStatus;
  final CurrenciesStatus currenciesStatus;

  final ExpensesSummaryEntity? summary;
  final List<ExpenseEntity>? expenses;
  final ExchangeRatesEntity? currencies;

  final DateFilter currentFilter;
  final int currentPage;
  final bool hasMoreExpenses;

  final String? summaryError;
  final String? expensesError;
  final String? currenciesError;

  const HomeState({
    this.summaryStatus = SummaryStatus.initial,
    this.expensesStatus = ExpensesStatus.initial,
    this.currenciesStatus = CurrenciesStatus.initial,
    this.summary,
    this.expenses,
    this.currencies,
    this.currentFilter = DateFilter.all,
    this.currentPage = 1,
    this.hasMoreExpenses = false,
    this.summaryError,
    this.expensesError,
    this.currenciesError,
  });

  const HomeState.initial() : this();

  HomeState copyWith({
    SummaryStatus? summaryStatus,
    ExpensesStatus? expensesStatus,
    CurrenciesStatus? currenciesStatus,
    ExpensesSummaryEntity? summary,
    List<ExpenseEntity>? expenses,
    ExchangeRatesEntity? currencies,
    DateFilter? currentFilter,
    int? currentPage,
    bool? hasMoreExpenses,
    String? summaryError,
    String? expensesError,
    String? currenciesError,
  }) {
    return HomeState(
      summaryStatus: summaryStatus ?? this.summaryStatus,
      expensesStatus: expensesStatus ?? this.expensesStatus,
      currenciesStatus: currenciesStatus ?? this.currenciesStatus,
      summary: summary ?? this.summary,
      expenses: expenses ?? this.expenses,
      currencies: currencies ?? this.currencies,
      currentFilter: currentFilter ?? this.currentFilter,
      currentPage: currentPage ?? this.currentPage,
      hasMoreExpenses: hasMoreExpenses ?? this.hasMoreExpenses,
      summaryError: summaryError ?? this.summaryError,
      expensesError: expensesError ?? this.expensesError,
      currenciesError: currenciesError ?? this.currenciesError,
    );
  }

  @override
  List<Object?> get props => [
    summaryStatus,
    expensesStatus,
    currenciesStatus,
    summary,
    expenses,
    currencies,
    currentFilter,
    currentPage,
    hasMoreExpenses,
    summaryError,
    expensesError,
    currenciesError,
  ];

  @override
  String toString() {
    return 'HomeState('
        'summaryStatus: $summaryStatus, '
        'expensesStatus: $expensesStatus, '
        'currenciesStatus: $currenciesStatus, '
        'currentFilter: $currentFilter, '
        'currentPage: $currentPage, '
        'hasMoreExpenses: $hasMoreExpenses'
        ')';
  }
}
