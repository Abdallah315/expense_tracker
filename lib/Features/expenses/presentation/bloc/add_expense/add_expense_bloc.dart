import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/fetch_currencies.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/save_expense.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_event.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_state.dart';
import 'package:inovola_task/core/utils/expense_validator.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final FetchCurrencies _fetchCurrencies;
  final SaveExpense _saveExpense;

  AddExpenseBloc({
    required FetchCurrencies fetchCurrencies,
    required SaveExpense saveExpense,
  }) : _fetchCurrencies = fetchCurrencies,
       _saveExpense = saveExpense,
       super(AddExpenseState.initial()) {
    on<LoadCurrenciesRequested>(_onLoadCurrenciesRequested);
    on<FormFieldUpdated>(_onFormFieldUpdated);
    on<SaveExpenseRequested>(_onSaveExpenseRequested);
    on<ValidateForm>(_onValidateForm);

    state.amountController.addListener(() => add(const ValidateForm()));
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

  void _onFormFieldUpdated(
    FormFieldUpdated event,
    Emitter<AddExpenseState> emit,
  ) {
    emit(
      state.copyWith(
        category: event.category ?? state.category,
        currency: event.currency ?? state.currency,
        date: event.date ?? state.date,
        selectedIconData: event.selectedIconData ?? state.selectedIconData,
        imageFile: event.imageFile ?? state.imageFile,
        file: event.file ?? state.file,
      ),
    );

    add(const ValidateForm());
  }

  void _onValidateForm(ValidateForm event, Emitter<AddExpenseState> emit) {
    final isValid = ExpenseValidator.isFormValid(
      amount: state.amountController.text,
      category: state.category ?? '',
      currency: state.currency ?? {},
      date: state.date,
      iconData: state.selectedIconData,
    );

    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> _onSaveExpenseRequested(
    SaveExpenseRequested event,
    Emitter<AddExpenseState> emit,
  ) async {
    final formData = state.getFormData();
    if (formData == null) return;

    await _saveExpense.call(
      iconData: formData['iconData'],
      category: formData['category'],
      amount: formData['amount'],
      currency: formData['currency'],
      date: formData['date'],
    );
  }

  @override
  Future<void> close() {
    state.amountController.dispose();
    return super.close();
  }
}
