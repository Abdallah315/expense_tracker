import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/expenses/domain/entities/exchange_rates_entity.dart';

enum CurrenciesStatus { initial, loading, loaded, error }

class AddExpenseState extends Equatable {
  final CurrenciesStatus currenciesStatus;

  final ExchangeRatesEntity? currencies;

  final String? currenciesError;

  const AddExpenseState({
    this.currenciesStatus = CurrenciesStatus.initial,
    this.currencies,
    this.currenciesError,
  });

  const AddExpenseState.initial() : this();

  AddExpenseState copyWith({
    CurrenciesStatus? currenciesStatus,
    ExchangeRatesEntity? currencies,
    String? currenciesError,
  }) {
    return AddExpenseState(
      currenciesStatus: currenciesStatus ?? this.currenciesStatus,
      currencies: currencies ?? this.currencies,
      currenciesError: currenciesError ?? this.currenciesError,
    );
  }

  @override
  List<Object?> get props => [currenciesStatus, currencies, currenciesError];

  @override
  String toString() {
    return 'AddExpenseState('
        'currenciesStatus: $currenciesStatus, '
        ')';
  }
}
