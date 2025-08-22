import 'package:inovola_task/Features/home/data/models/expenses_summary.dart';
import 'package:isar/isar.dart';

part 'expenses_summary_isar.g.dart';

@collection
class ExpensesSummaryIsar {
  Id id = 0;

  late double totalBalance;
  late double totalExpenses;
  late double totalIncome;

  static ExpensesSummaryIsar fromModel(ExpensesSummary e) {
    return ExpensesSummaryIsar()
      ..id = 0
      ..totalBalance = e.totalBalance.toDouble()
      ..totalExpenses = e.totalExpenses.toDouble()
      ..totalIncome = e.totalIncome.toDouble();
  }
}
