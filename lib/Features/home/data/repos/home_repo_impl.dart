import 'package:inovola_task/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/core/errors/failure.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<ExpensesSummaryEntity> fetchExpensesSummary({
    DateFilter filter = DateFilter.all,
  }) async {
    try {
      final cachedExpensesSummary = await homeLocalDataSource
          .fetchExpensesSummary(filter: filter);
      if (cachedExpensesSummary != null) {
        return cachedExpensesSummary.toEntity();
      }

      final remoteExpensesSummary = await homeRemoteDataSource
          .fetchExpensesSummary();
      await homeLocalDataSource.saveExpensesSummary(remoteExpensesSummary);
      return remoteExpensesSummary.toEntity();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<ExpenseEntity>> fetchHomeExpenses({
    DateFilter filter = DateFilter.all,
  }) async {
    try {
      final cachedExpenses = await homeLocalDataSource.fetchHomeExpenses(
        filter: filter,
      );

      if (cachedExpenses.isNotEmpty) {
        return cachedExpenses.map((model) => model.toEntity()).toList();
      }

      final remoteExpenses = await homeRemoteDataSource.fetchExpenses(
        filter: filter,
      );

      return remoteExpenses.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
