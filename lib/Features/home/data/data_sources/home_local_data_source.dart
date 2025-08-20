import 'package:inovola_task/core/models/expense.dart';
import 'package:inovola_task/core/models/expense_isar.dart';
import 'package:inovola_task/Features/home/data/models/expenses_summary_isar.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'package:inovola_task/core/database/app_database.dart';
import 'package:isar/isar.dart';

abstract class HomeLocalDataSource {
  Future<ExpensesSummaryEntity?> fetchExpensesSummary({
    DateFilter filter = DateFilter.all,
  });
  Future<void> saveExpensesSummary(ExpensesSummaryEntity expensesSummary);
  Future<List<ExpenseIsar>> fetchHomeExpenses({
    int offset = 0,
    int limit = 10,
    DateFilter filter = DateFilter.all,
  });
  Future<void> saveExpenses(List<Expense> expenses);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<ExpensesSummaryEntity?> fetchExpensesSummary({
    DateFilter filter = DateFilter.all,
  }) async {
    final isar = await AppDatabase.isar;

    final filteredExpenses = await _getFilteredExpenses(isar, filter);

    if (filteredExpenses.isEmpty) {
      return null;
    }

    double totalExpenses = 0;
    double totalIncome = 0;

    for (final expense in filteredExpenses) {
      if (expense.type.toLowerCase() == 'expense') {
        totalExpenses += expense.amountInUSD;
      } else if (expense.type.toLowerCase() == 'income') {
        totalIncome += expense.amountInUSD;
      }
    }

    final totalBalance = totalIncome - totalExpenses;

    return ExpensesSummaryEntity(
      totalBalance: totalBalance,
      totalExpenses: totalExpenses,
      totalIncome: totalIncome,
    );
  }

  Future<List<ExpenseIsar>> _getFilteredExpenses(
    Isar isar,
    DateFilter filter,
  ) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    switch (filter) {
      case DateFilter.all:
        return await isar.expenseIsars.where().sortByDateDesc().findAll();

      case DateFilter.thisMonth:
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1);

        return await isar.expenseIsars
            .filter()
            .dateBetween(startOfMonth, endOfMonth)
            .sortByDateDesc()
            .findAll();

      case DateFilter.lastSevenDays:
        final sevenDaysAgo = today.subtract(const Duration(days: 7));
        final endOfDay = DateTime(today.year, today.month, today.day);

        return await isar.expenseIsars
            .filter()
            .dateBetween(sevenDaysAgo, endOfDay)
            .sortByDateDesc()
            .findAll();
    }
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
  Future<List<ExpenseIsar>> fetchHomeExpenses({
    int offset = 0,
    int limit = 10,
    DateFilter filter = DateFilter.all,
  }) async {
    final isar = await AppDatabase.isar;

    final filteredExpenses = await _getFilteredExpenses(isar, filter);

    final startIndex = offset;
    final endIndex = offset + limit;

    if (startIndex >= filteredExpenses.length) {
      return [];
    }

    return filteredExpenses.skip(startIndex).take(limit).toList();
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
