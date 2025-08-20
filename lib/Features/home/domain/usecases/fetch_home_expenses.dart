import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';

class FetchHomeExpenses {
  final HomeRepo _repository;

  FetchHomeExpenses(this._repository);

  Future<List<ExpenseEntity>> call({
    int page = 1,
    int pageSize = 10,
    DateFilter filter = DateFilter.all,
  }) async {
    // ✅ Pass filter to repository for efficient database/API filtering
    return await _repository.fetchHomeExpenses(
      page: page,
      pageSize: pageSize,
      filter: filter,
    );
  }
}
