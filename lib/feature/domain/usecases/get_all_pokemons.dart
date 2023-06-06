import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_test_app/core/usecases/usecase.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test_app/feature/domain/repositories/pokemon_repository.dart';

import '../../../core/error/failure.dart';

class GetAllPokemons extends UseCase<List<PokemonEntity>, PagePokemonParams> {
  final PokemonRepository pokemonRepository;

  GetAllPokemons({required this.pokemonRepository});

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(
      PagePokemonParams params) async {
    return await pokemonRepository.getAllPokemons(params.page);
  }
}

class PagePokemonParams extends Equatable {
  final int page;
  const PagePokemonParams({required this.page});

  @override
  List<Object?> get props => [];
}
