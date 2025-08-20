import 'package:inovola_task/Features/expenses/data/models/exchange_rates.dart';
import 'package:inovola_task/core/models/expense.dart';

import 'package:inovola_task/core/networking/api_service.dart';
import 'package:inovola_task/core/networking/api_constants.dart';
import 'package:inovola_task/core/helpers/constants.dart';

abstract class ExpensesRemoteDataSource {
  Future<List<Expense>> fetchExpenses({int page = 1, int pageSize = 10});
  Future<ExchangeRates> fetchExchangeRates();
}

class ExpensesRemoteDataSourceImpl implements ExpensesRemoteDataSource {
  final ApiService apiService;

  ExpensesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Expense>> fetchExpenses({int page = 1, int pageSize = 10}) async {
    if (kUseFakeApi) {
      await Future<void>.delayed(const Duration(seconds: 2));
      return [];
    } else {
      final response = await apiService.get(endpoint: ApiConstants.expenses);
      final expenses = (response.data as List)
          .map((e) => Expense.fromMap(e))
          .toList();
      return expenses;
    }
  }

  @override
  Future<ExchangeRates> fetchExchangeRates() async {
    final response = await apiService.get(
      endpoint: ApiConstants.exchangeRates('USD'),
    );
    return ExchangeRates.fromMap(response.data);
  }
}
