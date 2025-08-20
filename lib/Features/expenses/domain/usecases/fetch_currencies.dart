import 'package:inovola_task/Features/expenses/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/Features/expenses/domain/repos/expenses_repo.dart';

class FetchCurrencies {
  final ExpensesRepo _repository;

  FetchCurrencies(this._repository);

  Future<ExchangeRatesEntity> call() async {
    return await _repository.fetchExchangeRates();
  }
}
