import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/fetch_currencies.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/save_expense.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_event.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final FetchCurrencies _fetchCurrencies;
  final SaveExpense _saveExpense;

  AddExpenseBloc({
    required FetchCurrencies fetchCurrencies,
    required SaveExpense saveExpense,
  }) : _fetchCurrencies = fetchCurrencies,
       _saveExpense = saveExpense,
       super(const AddExpenseState.initial()) {
    on<LoadCurrenciesRequested>(_onLoadCurrenciesRequested);
    on<SaveExpenseRequested>(_onSaveExpenseRequested);
  }

  Future<void> _onLoadCurrenciesRequested(
    LoadCurrenciesRequested event,
    Emitter<AddExpenseState> emit,
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
    Emitter<AddExpenseState> emit,
  ) async {
    await _saveExpense.call(
      iconData: event.iconData,
      category: event.category,
      amount: event.amount,
      currency: event.currency,
      date: event.date,
    );

    // add(const LoadHomeDataRequested());
  }
}
