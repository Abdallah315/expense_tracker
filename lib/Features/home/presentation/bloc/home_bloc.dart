import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses_summary.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_currencies.dart';
import 'package:inovola_task/Features/home/domain/usecases/save_expense.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchExpensesSummary _fetchExpensesSummary;
  final FetchExpenses _fetchExpenses;
  final FetchCurrencies _fetchCurrencies;
  final SaveExpense _saveExpense;

  static const int _pageSize = 10;

  HomeBloc({
    required FetchExpensesSummary fetchExpensesSummary,
    required FetchExpenses fetchExpenses,
    required FetchCurrencies fetchCurrencies,
    required SaveExpense saveExpense,
  }) : _fetchExpensesSummary = fetchExpensesSummary,
       _fetchExpenses = fetchExpenses,
       _fetchCurrencies = fetchCurrencies,
       _saveExpense = saveExpense,
       super(const HomeState.initial()) {
    on<LoadHomeDataRequested>(_onLoadHomeDataRequested);
    on<LoadMoreExpensesRequested>(_onLoadMoreExpensesRequested);
    on<FilterChangedEvent>(_onFilterChanged);
    on<LoadCurrenciesRequested>(_onLoadCurrenciesRequested);
    on<SaveExpenseRequested>(_onSaveExpenseRequested);
  }

  Future<void> _onLoadHomeDataRequested(
    LoadHomeDataRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        summaryStatus: SummaryStatus.loading,
        expensesStatus: ExpensesStatus.loading,
      ),
    );

    await Future.wait([_loadSummary(emit), _loadInitialExpenses(emit)]);
  }

  Future<void> _loadSummary(Emitter<HomeState> emit) async {
    try {
      final summary = await _fetchExpensesSummary.call();

      emit(
        state.copyWith(
          summaryStatus: SummaryStatus.loaded,
          summary: summary,
          summaryError: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          summaryStatus: SummaryStatus.error,
          summaryError: e.toString(),
        ),
      );
    }
  }

  Future<void> _loadInitialExpenses(Emitter<HomeState> emit) async {
    try {
      final expenses = await _fetchExpenses.call(page: 1, pageSize: 6);

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: expenses,
          currentPage: 1,
          hasMoreExpenses: expenses.length == 6,
          expensesError: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.error,
          expensesError: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMoreExpensesRequested(
    LoadMoreExpensesRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.expensesStatus != ExpensesStatus.loaded ||
        state.expenses == null ||
        !state.hasMoreExpenses) {
      return;
    }

    emit(state.copyWith(expensesStatus: ExpensesStatus.loadingMore));

    try {
      final currentPage = state.currentPage + 1;

      final moreExpenses = await _fetchExpenses.call(
        page: currentPage,
        pageSize: _pageSize,
        filter: state.currentFilter,
      );

      final updatedExpenses = [...state.expenses!, ...moreExpenses];

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: updatedExpenses,
          currentPage: currentPage,
          hasMoreExpenses: moreExpenses.length == _pageSize,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expensesError: e.toString(),
        ),
      );
    }
  }

  Future<void> _onFilterChanged(
    FilterChangedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        expensesStatus: ExpensesStatus.loading,
        expenses: null,
        currentFilter: event.filter,
        currentPage: 1,
        hasMoreExpenses: false,
      ),
    );

    try {
      final filteredExpenses = await _fetchExpenses.call(
        page: 1,
        pageSize: 6,
        filter: event.filter,
      );

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: filteredExpenses,
          hasMoreExpenses: filteredExpenses.length == 6,
          expensesError: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.error,
          expensesError: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadCurrenciesRequested(
    LoadCurrenciesRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(currenciesStatus: CurrenciesStatus.loading));

    try {
      final currencies = await _fetchCurrencies.call();

      emit(
        state.copyWith(
          currenciesStatus: CurrenciesStatus.loaded,
          currencies: currencies,
          currenciesError: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          currenciesStatus: CurrenciesStatus.error,
          currenciesError: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSaveExpenseRequested(
    SaveExpenseRequested event,
    Emitter<HomeState> emit,
  ) async {
    print('💾 Saving expense...');
    emit(state.copyWith(expensesStatus: ExpensesStatus.loading));

    try {
      await _saveExpense.call(
        iconData: event.iconData,
        category: event.category,
        amount: event.amount,
        currency: event.currency,
        date: event.date,
      );

      print('✅ Expense saved successfully!');

      // Refresh expenses list after saving
      add(const LoadHomeDataRequested());
    } catch (e) {
      print('❌ Failed to save expense: $e');
      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.error,
          expensesError: e.toString(),
        ),
      );
    }
  }
}
