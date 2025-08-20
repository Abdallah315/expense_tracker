import 'package:inovola_task/core/models/expense.dart';
import 'package:inovola_task/Features/home/data/models/expenses_summary.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';

import 'package:inovola_task/core/networking/api_service.dart';
import 'package:inovola_task/core/networking/api_constants.dart';
import 'package:inovola_task/core/helpers/constants.dart';

abstract class HomeRemoteDataSource {
  Future<ExpensesSummary> fetchExpensesSummary();
  Future<List<Expense>> fetchExpenses({
    int page = 1,
    int pageSize = 10,
    DateFilter filter = DateFilter.all,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<ExpensesSummary> fetchExpensesSummary() async {
    // if (kUseFakeApi) {
    //   await Future<void>.delayed(const Duration(seconds: 2));
    //   return ExpensesSummary(
    //     totalBalance: 1500,
    //     totalExpenses: 900,
    //     totalIncome: 2400,
    //   );
    // } else {
    final response = await apiService.get(
      endpoint: ApiConstants.expensesSummary,
    );
    return ExpensesSummary.fromMap(response.data);
    // }
  }

  @override
  Future<List<Expense>> fetchExpenses({
    int page = 1,
    int pageSize = 10,
    DateFilter filter = DateFilter.all,
  }) async {
    if (kUseFakeApi) {
      await Future<void>.delayed(const Duration(seconds: 2));
      return [];
    } else {
      final response = await apiService.get(
        endpoint: ApiConstants.expenses,
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          'filter': filter.name,
        },
      );
      final expenses = (response.data as List)
          .map((e) => Expense.fromMap(e))
          .toList();
      return expenses;
    }
  }
}
