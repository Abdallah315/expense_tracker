import 'package:inovola_task/Features/home/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';

class FetchCurrencies {
  final HomeRepo _repository;

  FetchCurrencies(this._repository);

  Future<ExchangeRatesEntity> call() async {
    return await _repository.fetchExchangeRates();
  }
}
