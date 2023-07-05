import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokemon_test_app/feature/data/datasources/local_datasource.dart';
import 'package:pokemon_test_app/feature/data/datasources/remote_datasource.dart';
import 'package:pokemon_test_app/feature/data/repositories/pokemons_repository_impl.dart';
import 'package:pokemon_test_app/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon_test_app/feature/domain/usecases/get_details.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_all_pokemons_bloc/get_all_pokemons_bloc.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_details_bloc/get_details_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network_info.dart';
import 'feature/domain/repositories/pokemon_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => GetAllPokemonsBloc(getAllPokemons: sl()));
  sl.registerFactory(() => GetDetailsBloc(getDetails: sl()));

  sl.registerLazySingleton(() => GetAllPokemons(sl()));
  sl.registerLazySingleton(() => GetPokemonDetails(sl()));

  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: Dio()),
  );
  sl.registerLazySingleton<LocalDatasource>(
    () => LocalDatasourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
