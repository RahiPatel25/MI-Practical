import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mi_practical/core/local_storage/local_storage.dart';
import 'package:mi_practical/core/network/api_service.dart';
import 'package:mi_practical/core/network/response_handler.dart';
import 'package:mi_practical/core/print/debug_print.dart';
import 'package:mi_practical/modules/home/data/datasources/home_datasource.dart';
import 'package:mi_practical/modules/home/data/repositories/home_repositories_impl.dart';
import 'package:mi_practical/modules/home/domain/repositories/home_repositories.dart';
import 'package:mi_practical/modules/home/domain/usecases/home_usecases.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

void diInit() {
  // bloc
  sl.registerFactory(() => HomeBloc());

  // usecase
  sl.registerLazySingleton(() => HomeUseCase());

  // repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(),
  );

  // data source
  sl.registerLazySingleton(() => ApiService());
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourcesImpl());
  sl.registerLazySingleton(() => ResponseHandler());
  sl.registerLazySingleton(() => LocalStorageManagerX());

  // external
  sl.registerFactory<PrintX>(() => PrintX());
  sl.registerFactory(() => http.Client());
}
