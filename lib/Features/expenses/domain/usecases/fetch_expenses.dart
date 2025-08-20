import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/expenses/domain/repos/expenses_repo.dart';

class FetchExpenses {
  final ExpensesRepo _repository;

  FetchExpenses(this._repository);

  Future<List<ExpenseEntity>> call({int page = 1, int pageSize = 10}) async {
    final allExpenses = await _repository.fetchExpenses(
      page: page,
      pageSize: pageSize,
    );
    return allExpenses;
  }
}
