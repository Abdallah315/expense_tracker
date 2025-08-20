import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';

abstract class HomeRepo {
  Future<ExpensesSummaryEntity> fetchExpensesSummary({
    DateFilter filter = DateFilter.all,
  });
  Future<List<ExpenseEntity>> fetchHomeExpenses({
    int page = 1,
    int pageSize = 10,
    DateFilter filter = DateFilter.all,
  });
}
