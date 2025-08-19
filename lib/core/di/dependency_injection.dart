import 'package:get_it/get_it.dart';
import 'package:inovola_task/core/networking/api_service.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:inovola_task/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:inovola_task/Features/home/data/repos/home_repo_impl.dart';
import 'package:inovola_task/Features/home/domain/repos/home_repo.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses_summary.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_expenses.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_currencies.dart';
// BLoCs
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Core services
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Home feature - Data Sources
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Home feature - Repository
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  // Home feature - Use Cases
  getIt.registerLazySingleton<FetchExpensesSummary>(
    () => FetchExpensesSummary(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchExpenses>(
    () => FetchExpenses(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchCurrencies>(
    () => FetchCurrencies(getIt<HomeRepo>()),
  );

  // Home feature - BLoC (Factory registration for multiple instances)
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      fetchExpensesSummary: getIt<FetchExpensesSummary>(),
      fetchExpenses: getIt<FetchExpenses>(),
      fetchCurrencies: getIt<FetchCurrencies>(),
    ),
  );
}
