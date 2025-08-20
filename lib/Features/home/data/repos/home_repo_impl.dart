import 'dart:developer';

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
  Future<ExpensesSummaryEntity> fetchExpensesSummary() async {
    try {
      final cachedExpensesSummary = await homeLocalDataSource
          .fetchExpensesSummary();
      if (cachedExpensesSummary != null) {
        return cachedExpensesSummary;
      }
      final remoteExpensesSummary = await homeRemoteDataSource
          .fetchExpensesSummary();
      final entity = remoteExpensesSummary.toEntity();
      await homeLocalDataSource.saveExpensesSummary(entity);
      return entity;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<ExpenseEntity>> fetchHomeExpenses({
    int page = 1,
    int pageSize = 6,
    DateFilter filter = DateFilter.all,
  }) async {
    try {
      final offset = (page - 1) * pageSize;

      // ✅ Apply filter at data source level for efficiency
      final cachedExpenses = await homeLocalDataSource.fetchHomeExpenses(
        offset: offset,
        limit: pageSize,
        filter: filter,
      );

      if (cachedExpenses.isNotEmpty) {
        log(
          'cachedExpenses for page $page with filter $filter: ${cachedExpenses.length} items',
        );
        return cachedExpenses.map((model) => model.toEntity()).toList();
      }

      final remoteExpenses = await homeRemoteDataSource.fetchExpenses(
        page: page,
        pageSize: pageSize,
        filter: filter,
      );

      await homeLocalDataSource.saveExpenses(remoteExpenses);

      return remoteExpenses.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
