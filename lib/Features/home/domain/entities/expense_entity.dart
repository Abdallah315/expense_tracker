import 'package:inovola_task/core/helpers/enums.dart';

class ExpenseEntity {
  final int id;
  final String type;
  final CategoriesEnum category;
  final double amount;
  final String currency;
  final double amountInUSD;
  final double exchangeRate;
  final DateTime date;

  ExpenseEntity({
    required this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.currency,
    required this.amountInUSD,
    required this.exchangeRate,
    required this.date,
  });
}
