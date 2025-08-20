import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';

enum DateFilter { all, thisMonth, lastSevenDays }

class FetchHomeExpenses {
  final HomeRepo _repository;

  FetchHomeExpenses(this._repository);

  Future<List<ExpenseEntity>> call({
    int page = 1,
    int pageSize = 10,
    DateFilter filter = DateFilter.all,
  }) async {
    final allExpenses = await _repository.fetchHomeExpenses(
      page: page,
      pageSize: pageSize,
    );

    switch (filter) {
      case DateFilter.all:
        return allExpenses;
      case DateFilter.thisMonth:
        return _filterThisMonth(allExpenses);
      case DateFilter.lastSevenDays:
        return _filterLastSevenDays(allExpenses);
    }
  }

  List<ExpenseEntity> _filterThisMonth(List<ExpenseEntity> expenses) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    return expenses.where((expense) {
      return expense.date.isAfter(startOfMonth) &&
          expense.date.isBefore(endOfMonth);
    }).toList();
  }

  List<ExpenseEntity> _filterLastSevenDays(List<ExpenseEntity> expenses) {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));

    return expenses.where((expense) {
      return expense.date.isAfter(sevenDaysAgo);
    }).toList();
  }
}
