import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';

class FetchExpensesSummary {
  final HomeRepo _repository;

  FetchExpensesSummary(this._repository);

  Future<ExpensesSummaryEntity> call() async {
    return await _repository.fetchExpensesSummary();
  }
}
