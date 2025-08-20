import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/fetch_expenses.dart';
import 'expenses_event.dart';
import 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final FetchExpenses _fetchExpenses;

  static const int _pageSize = 10;

  ExpensesBloc({required FetchExpenses fetchExpenses})
    : _fetchExpenses = fetchExpenses,
      super(const ExpensesState.initial()) {
    on<LoadFullExpensesRequested>(_onLoadFullExpensesRequested);
    on<LoadMoreExpensesRequested>(_onLoadMoreExpensesRequested);
  }

  Future<void> _onLoadFullExpensesRequested(
    LoadFullExpensesRequested event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(state.copyWith(expensesStatus: ExpensesStatus.loading));

    try {
      final expenses = await _fetchExpenses.call(page: 1, pageSize: _pageSize);

      emit(
        state.copyWith(
          expensesStatus: ExpensesStatus.loaded,
          expenses: expenses,
          currentPage: 1,
          hasMoreExpenses: expenses.length == _pageSize,
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
    Emitter<ExpensesState> emit,
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
      );

      final existingExpenseIds = state.expenses!.map((e) => e.id).toSet();
      final newExpenses = moreExpenses
          .where((expense) => !existingExpenseIds.contains(expense.id))
          .toList();

      final updatedExpenses = [...state.expenses!, ...newExpenses];

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
          expensesStatus: ExpensesStatus.error,
          expensesError: e.toString(),
        ),
      );
    }
  }
}
