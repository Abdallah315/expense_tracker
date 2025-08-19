import 'package:inovola_task/Features/home/data/models/expense.dart';
import 'package:inovola_task/Features/home/data/models/expense_isar.dart';
import 'package:inovola_task/Features/home/data/models/expenses_summary_isar.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/core/database/app_database.dart';
import 'package:isar/isar.dart';

abstract class HomeLocalDataSource {
  Future<ExpensesSummaryEntity?> fetchExpensesSummary();
  Future<void> saveExpensesSummary(ExpensesSummaryEntity expensesSummary);
  Future<void> saveExpense(Expense expense);
  Future<List<ExpenseIsar>> fetchExpenses({int offset = 0, int limit = 10});
  Future<void> saveExpenses(List<Expense> expenses);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<ExpensesSummaryEntity?> fetchExpensesSummary() async {
    final isar = await AppDatabase.isar;
    final doc = await isar.expensesSummaryIsars.get(0);
    return doc?.toEntity();
  }

  @override
  Future<void> saveExpensesSummary(
    ExpensesSummaryEntity expensesSummary,
  ) async {
    final isar = await AppDatabase.isar;
    await isar.writeTxn(() async {
      await isar.expensesSummaryIsars.put(
        ExpensesSummaryIsar.fromEntity(expensesSummary),
      );
    });
  }

  @override
  Future<void> saveExpense(Expense expense) async {
    final isar = await AppDatabase.isar;
    await isar.writeTxn(() async {
      await isar.expenseIsars.put(ExpenseIsar.fromModel(expense));
    });
  }

  @override
  Future<List<ExpenseIsar>> fetchExpenses({
    int offset = 0,
    int limit = 10,
  }) async {
    final isar = await AppDatabase.isar;
    final expenses = await isar.expenseIsars
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
    return expenses;
  }

  @override
  Future<void> saveExpenses(List<Expense> expenses) async {
    final isar = await AppDatabase.isar;
    await isar.writeTxn(() async {
      final isarExpenses = expenses
          .map((e) => ExpenseIsar.fromModel(e))
          .toList();
      await isar.expenseIsars.putAll(isarExpenses);
    });
  }
}
