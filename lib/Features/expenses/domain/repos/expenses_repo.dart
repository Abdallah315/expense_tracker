import 'package:inovola_task/Features/expenses/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';

abstract class ExpensesRepo {
  Future<List<ExpenseEntity>> fetchExpenses({int page = 1, int pageSize = 10});
  Future<ExchangeRatesEntity> fetchExchangeRates();
  Future<void> saveExpense(ExpenseEntity expense);
}
