import 'dart:developer';

import 'package:inovola_task/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:inovola_task/Features/home/data/models/expense.dart';
import 'package:inovola_task/Features/home/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';
import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';
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
  Future<List<ExpenseEntity>> fetchExpenses({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      // Calculate offset based on page number (page starts from 1)
      final offset = (page - 1) * pageSize;

      // Always try to get from cache first with proper pagination
      final cachedExpenses = await homeLocalDataSource.fetchExpenses(
        offset: offset,
        limit: pageSize,
      );

      // If we have cached data for this page, return it
      if (cachedExpenses.isNotEmpty) {
        log('cachedExpenses for page $page: ${cachedExpenses.length} items');
        return cachedExpenses.map((model) => model.toEntity()).toList();
      }

      // If no cached data for this page, fetch from remote
      final remoteExpenses = await homeRemoteDataSource.fetchExpenses(
        page: page,
        pageSize: pageSize,
      );

      // Save remote expenses to cache
      await homeLocalDataSource.saveExpenses(remoteExpenses);

      return remoteExpenses.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<ExchangeRatesEntity> fetchExchangeRates() async {
    try {
      final remoteExchangeRates = await homeRemoteDataSource
          .fetchExchangeRates();
      final entity = remoteExchangeRates.toEntity();
      return entity;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> saveExpense(ExpenseEntity expense) async {
    await homeLocalDataSource.saveExpense(Expense.fromEntity(expense));
  }
}
