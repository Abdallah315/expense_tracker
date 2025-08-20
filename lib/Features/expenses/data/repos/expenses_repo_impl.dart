import 'dart:developer';

import 'package:inovola_task/Features/expenses/data/data_sources/expenses_local_data_source.dart';
import 'package:inovola_task/Features/expenses/data/data_sources/expenses_remote_data_source.dart';
import 'package:inovola_task/core/models/expense.dart';
import 'package:inovola_task/Features/expenses/domain/entities/exchange_rates_entity.dart';
import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/core/errors/failure.dart';

import '../../domain/repos/expenses_repo.dart';

class ExpensesRepoImpl implements ExpensesRepo {
  final ExpensesRemoteDataSource expensesRemoteDataSource;
  final ExpensesLocalDataSource expensesLocalDataSource;

  ExpensesRepoImpl({
    required this.expensesRemoteDataSource,
    required this.expensesLocalDataSource,
  });

  @override
  Future<List<ExpenseEntity>> fetchExpenses({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final offset = (page - 1) * pageSize;

      final cachedExpenses = await expensesLocalDataSource.fetchExpenses(
        offset: offset,
        limit: pageSize,
      );

      if (cachedExpenses.isNotEmpty) {
        log('cachedExpenses for page $page: ${cachedExpenses.length} items');
        return cachedExpenses.map((model) => model.toEntity()).toList();
      }

      final remoteExpenses = await expensesRemoteDataSource.fetchExpenses(
        page: page,
        pageSize: pageSize,
      );

      await expensesLocalDataSource.saveExpenses(remoteExpenses);

      return remoteExpenses.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<ExchangeRatesEntity> fetchExchangeRates() async {
    try {
      final remoteExchangeRates = await expensesRemoteDataSource
          .fetchExchangeRates();
      final entity = remoteExchangeRates.toEntity();
      return entity;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> saveExpense(ExpenseEntity expense) async {
    await expensesLocalDataSource.saveExpense(Expense.fromEntity(expense));
  }
}
