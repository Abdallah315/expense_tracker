import 'package:inovola_task/Features/home/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';

abstract class HomeRepo {
  Future<ExpensesSummaryEntity> fetchExpensesSummary();
  Future<List<ExpenseEntity>> fetchExpenses({int page = 1, int pageSize = 10});
  Future<ExchangeRatesEntity> fetchExchangeRates();
  Future<void> saveExpense(ExpenseEntity expense);
}
