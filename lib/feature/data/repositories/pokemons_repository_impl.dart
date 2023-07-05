import 'package:dartz/dartz.dart';
import 'package:pokemon_test_app/core/error/exception.dart';
import 'package:pokemon_test_app/core/error/failure.dart';
import 'package:pokemon_test_app/feature/data/datasources/local_datasource.dart';
import 'package:pokemon_test_app/feature/data/datasources/remote_datasource.dart';
import 'package:pokemon_test_app/feature/data/models/pokemon_model.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';
import 'package:pokemon_test_app/feature/domain/repositories/pokemon_repository.dart';

import '../../../core/platform/network_info.dart';

class PokemonsRepositoryImpl implements PokemonRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  PokemonsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PokemonModel>>> getAllPokemons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePokemons = await remoteDataSource.getAllPokemons(page);
        localDataSource.pokemonsToCache(remotePokemons);
        return Right(remotePokemons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPokemons = await localDataSource.getLastPokemonsFromCache();
        return Right(localPokemons);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, DetailsEntity>> getDetails(String url) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDetails = await remoteDataSource.getDetails(url);
        return Right(remoteDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw ServerFailure();
    }
  }
}
