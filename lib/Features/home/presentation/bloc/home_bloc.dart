import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses_summary.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_home_expenses.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchExpensesSummary _fetchExpensesSummary;
  final FetchHomeExpenses _fetchHomeExpenses;

  HomeBloc({
    required FetchExpensesSummary fetchExpensesSummary,
    required FetchHomeExpenses fetchHomeExpenses,
  }) : _fetchExpensesSummary = fetchExpensesSummary,
       _fetchHomeExpenses = fetchHomeExpenses,
       super(const HomeState.initial()) {
    on<LoadHomeDataRequested>(_onLoadHomeDataRequested);
    on<FilterChangedEvent>(_onFilterChanged);
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
      final summary = await _fetchExpensesSummary.call(
        filter: state.currentFilter,
      );

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
      final expenses = await _fetchHomeExpenses.call();

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: expenses,
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

  Future<void> _onFilterChanged(
    FilterChangedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        summaryStatus: SummaryStatus.loading,
        expensesStatus: ExpensesStatus.loading,
        expenses: null,
        currentFilter: event.filter,
      ),
    );

    await Future.wait([
      _loadSummaryWithFilter(emit, event.filter),
      _loadExpensesWithFilter(emit, event.filter),
    ]);
  }

  Future<void> _loadSummaryWithFilter(
    Emitter<HomeState> emit,
    DateFilter filter,
  ) async {
    try {
      final summary = await _fetchExpensesSummary.call(filter: filter);

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

  Future<void> _loadExpensesWithFilter(
    Emitter<HomeState> emit,
    DateFilter filter,
  ) async {
    try {
      final filteredExpenses = await _fetchHomeExpenses.call(filter: filter);

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: filteredExpenses,
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
}
