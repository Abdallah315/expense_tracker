import 'package:isar/isar.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';

part 'expenses_summary_isar.g.dart';

@collection
class ExpensesSummaryIsar {
  Id id = 0;

  late double totalBalance;
  late double totalExpenses;
  late double totalIncome;

  ExpensesSummaryEntity toEntity() => ExpensesSummaryEntity(
    totalBalance: totalBalance,
    totalExpenses: totalExpenses,
    totalIncome: totalIncome,
  );

  static ExpensesSummaryIsar fromEntity(ExpensesSummaryEntity e) {
    return ExpensesSummaryIsar()
      ..id = 0
      ..totalBalance = e.totalBalance.toDouble()
      ..totalExpenses = e.totalExpenses.toDouble()
      ..totalIncome = e.totalIncome.toDouble();
  }
}
