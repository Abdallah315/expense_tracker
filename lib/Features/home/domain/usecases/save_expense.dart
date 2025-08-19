import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

class SaveExpense {
  final HomeRepo _repository;

  SaveExpense(this._repository);

  Future<void> call({
    required CategoryIconData iconData,
    required String category,
    required double amount,
    required String currency,
    required DateTime date,
  }) async {
    // Convert category string to enum
    final categoryEnum = CategoriesEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == category.toLowerCase(),
      orElse: () => CategoriesEnum.shopping,
    );

    // For now, we'll use 1.0 as exchange rate for USD,
    // you can get the actual rate from your currencies state
    final exchangeRate = currency == 'USD' ? 1.0 : 1.0;
    final amountInUSD = currency == 'USD' ? amount : amount / exchangeRate;

    final expense = ExpenseEntity(
      id: DateTime.now().millisecondsSinceEpoch, // Simple ID generation
      type: 'expense',
      iconData: iconData,
      category: categoryEnum,
      amount: amount,
      currency: currency,
      amountInUSD: amountInUSD,
      exchangeRate: exchangeRate,
      date: date,
    );

    await _repository.saveExpense(expense);
  }
}
