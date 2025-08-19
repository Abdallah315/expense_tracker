import 'package:inovola_task/Features/home/data/models/expense.dart';
import 'package:inovola_task/core/helpers/enums.dart';

const kExpensesSummaryBox = 'expenses_summary_box';
const bool kUseFakeApi = true;

const int kFakeExpensesTotal = 1000;

// Common currencies and their approximate exchange rates to USD
const Map<String, double> kFakeExchangeRates = {
  'USD': 1.0,
  'EUR': 0.85,
  'GBP': 0.73,
  'JPY': 110.0,
  'CAD': 1.25,
  'AUD': 1.35,
  'CHF': 0.92,
  'CNY': 6.45,
};

List<Expense> getExpenses({int page = 1, int pageSize = 10}) {
  if (page < 1 || pageSize < 1) return const [];

  final int startIndex = (page - 1) * pageSize;
  if (startIndex >= kFakeExpensesTotal) return const [];

  final int endExclusive = (startIndex + pageSize) > kFakeExpensesTotal
      ? kFakeExpensesTotal
      : (startIndex + pageSize);

  final categories = CategoriesEnum.values;
  final currencies = kFakeExchangeRates.keys.toList();

  return List<Expense>.generate(endExclusive - startIndex, (int i) {
    final int index = startIndex + i;
    final int id = index + 1;
    final category = categories[index % categories.length];
    final currency = currencies[index % currencies.length];
    final double amount = ((index % 9) + 1) * 100.0;
    final double exchangeRate = kFakeExchangeRates[currency]!;
    final double amountInUSD = currency == 'USD'
        ? amount
        : amount / exchangeRate;
    final DateTime date = DateTime.now().subtract(Duration(days: index));

    return Expense(
      id: id,
      type: 'Expense $id',
      category: category,
      amount: amount,
      currency: currency,
      amountInUSD: amountInUSD,
      exchangeRate: exchangeRate,
      date: date,
    );
  });
}
