import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:players_task/core/network/network_info.dart';
import 'package:players_task/data/data_source/remote/remote_data_source.dart';
import 'package:players_task/data/repository/repository.dart';
import 'package:players_task/domain/repository/base_repository.dart';
import 'package:players_task/domain/usecases/get_players_usecase.dart';
import 'package:players_task/presentation/features/add_players/controllers/cubit.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
   static void init() {

    // Core
    getIt.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(InternetConnectionChecker()));

    // Bloc
    getIt.registerFactory(() => AddPlayersCubit(getIt()));

    // Usecase
    getIt.registerLazySingleton<GetPlayersUseCase>(() => GetPlayersUseCase(getIt()));

    // Repository
    getIt.registerLazySingleton<BaseRepository>(() => Repository(getIt(), getIt()));

    // Data Source
    getIt.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}