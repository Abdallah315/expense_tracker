import 'package:inovola_task/core/database/app_database.dart';
import 'package:inovola_task/core/models/expense.dart';
import 'package:inovola_task/core/models/expense_isar.dart';
import 'package:isar/isar.dart';

abstract class ExpensesLocalDataSource {
  Future<void> saveExpense(Expense expense);
  Future<List<ExpenseIsar>> fetchExpenses({int offset = 0, int limit = 10});
  Future<void> saveExpenses(List<Expense> expenses);
}

class ExpensesLocalDataSourceImpl extends ExpensesLocalDataSource {
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
        .sortByDateDesc()
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
