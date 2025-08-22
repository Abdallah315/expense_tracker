import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';

abstract class HomeRepo {
  Future<ExpensesSummaryEntity> fetchExpensesSummary({
    DateFilter filter = DateFilter.all,
  });
  Future<List<ExpenseEntity>> fetchHomeExpenses({
    DateFilter filter = DateFilter.all,
  });
}
