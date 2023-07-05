import 'package:dartz/dartz.dart';
import 'package:pokemon_test_app/core/error/failure.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemons(int page);
  Future<Either<Failure, DetailsEntity>> getDetails(String url);
}
