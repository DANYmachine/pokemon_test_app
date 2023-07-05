import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetails extends UseCase<DetailsEntity, UrlDetailsParams> {
  final PokemonRepository pokemonRepository;

  GetPokemonDetails(this.pokemonRepository);

  @override
  Future<Either<Failure, DetailsEntity>> call(UrlDetailsParams params) async {
    return await pokemonRepository.getDetails(params.url);
  }
}

class UrlDetailsParams extends Equatable {
  final String url;
  const UrlDetailsParams({required this.url});

  @override
  List<Object?> get props => [];
}
