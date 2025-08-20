import 'package:get_it/get_it.dart';
import 'package:inovola_task/Features/expenses/data/data_sources/expenses_local_data_source.dart';
import 'package:inovola_task/Features/expenses/data/data_sources/expenses_remote_data_source.dart';
import 'package:inovola_task/Features/expenses/data/repos/expenses_repo_impl.dart';
import 'package:inovola_task/Features/expenses/domain/repos/expenses_repo.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/fetch_currencies.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/fetch_expenses.dart';
import 'package:inovola_task/Features/expenses/domain/usecases/save_expense.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_bloc.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/add_expense/add_expense_form_cubit.dart';
import 'package:inovola_task/Features/expenses/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/core/networking/api_service.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:inovola_task/Features/home/data/repos/home_repo_impl.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses_summary.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_home_expenses.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FetchExpensesSummary>(
    () => FetchExpensesSummary(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchHomeExpenses>(
    () => FetchHomeExpenses(getIt<HomeRepo>()),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      fetchExpensesSummary: getIt<FetchExpensesSummary>(),
      fetchHomeExpenses: getIt<FetchHomeExpenses>(),
    ),
  );

  getIt.registerLazySingleton<ExpensesLocalDataSource>(
    () => ExpensesLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ExpensesRemoteDataSource>(
    () => ExpensesRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ExpensesRepo>(
    () => ExpensesRepoImpl(
      expensesRemoteDataSource: getIt<ExpensesRemoteDataSource>(),
      expensesLocalDataSource: getIt<ExpensesLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FetchExpenses>(
    () => FetchExpenses(getIt<ExpensesRepo>()),
  );
  getIt.registerLazySingleton<FetchCurrencies>(
    () => FetchCurrencies(getIt<ExpensesRepo>()),
  );
  getIt.registerLazySingleton<SaveExpense>(
    () => SaveExpense(getIt<ExpensesRepo>()),
  );

  getIt.registerFactory<ExpensesBloc>(
    () => ExpensesBloc(fetchExpenses: getIt<FetchExpenses>()),
  );

  getIt.registerFactory<AddExpenseBloc>(
    () => AddExpenseBloc(
      fetchCurrencies: getIt<FetchCurrencies>(),
      saveExpense: getIt<SaveExpense>(),
    ),
  );

  getIt.registerFactory<AddExpenseFormCubit>(() => AddExpenseFormCubit());
}
