import 'package:get_it/get_it.dart';
import 'package:inovola_task/core/networking/api_service.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:inovola_task/Features/home/data/repos/home_repo_impl.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses_summary.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_currencies.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';

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
  getIt.registerLazySingleton<FetchExpenses>(
    () => FetchExpenses(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchCurrencies>(
    () => FetchCurrencies(getIt<HomeRepo>()),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      fetchExpensesSummary: getIt<FetchExpensesSummary>(),
      fetchExpenses: getIt<FetchExpenses>(),
      fetchCurrencies: getIt<FetchCurrencies>(),
    ),
  );
}
