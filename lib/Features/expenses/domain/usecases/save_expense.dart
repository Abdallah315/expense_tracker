import 'package:inovola_task/Features/expenses/domain/repos/expenses_repo.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

class SaveExpense {
  final ExpensesRepo _repository;

  SaveExpense(this._repository);

  Future<void> call({
    required CategoryIconData iconData,
    required String category,
    required double amount,
    required Map<String, num> currency,
    required DateTime date,
  }) async {
    final categoryEnum = CategoriesEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == category.toLowerCase(),
      orElse: () => CategoriesEnum.shopping,
    );

    final exchangeRate = currency.values.firstOrNull ?? 1.0;
    final amountInUSD = amount / exchangeRate;

    final expense = ExpenseEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      type: 'expense',
      iconData: iconData,
      category: categoryEnum,
      amount: amount,
      currency: currency.keys.first,
      amountInUSD: amountInUSD,
      exchangeRate: exchangeRate.toDouble(),
      date: date,
    );

    await _repository.saveExpense(expense);
  }
}
