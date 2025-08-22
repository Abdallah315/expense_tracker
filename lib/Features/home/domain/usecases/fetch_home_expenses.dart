import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';

class FetchHomeExpenses {
  final HomeRepo _repository;

  FetchHomeExpenses(this._repository);

  Future<List<ExpenseEntity>> call({DateFilter filter = DateFilter.all}) async {
    return await _repository.fetchHomeExpenses(filter: filter);
  }
}
