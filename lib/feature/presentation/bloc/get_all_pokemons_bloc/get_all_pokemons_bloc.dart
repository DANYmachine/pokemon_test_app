// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test_app/feature/domain/usecases/get_all_pokemons.dart';

import '../../../../core/error/failure.dart';

part 'get_all_pokemons_event.dart';
part 'get_all_pokemons_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class GetAllPokemonsBloc extends Bloc<GetAllPokemonsEvent, GetAllPokemonsState> {
  final GetAllPokemons getAllPokemons;
  int page = 1;
  GetAllPokemonsBloc({required this.getAllPokemons}) : super(PokemonsEmpty()) {
    on<GetPokemonsEvent>((event, emit) async {
      final currentState = state;
      var oldPokemons = <PokemonEntity>[];

      if (currentState is PokemonsLoaded) {
        oldPokemons = currentState.pokemonsList;
      }
      emit(PokemonsLoading(oldPokemons, isFirstFetch: page == 1));

      final failureOrPokemon = await getAllPokemons(PagePokemonParams(page: page));

      failureOrPokemon.fold(
        (error) => emit(PokemonsError(message: _mapFailureToMessage(error))),
        (pokemon) {
          page++;
          final pokemons = (state as PokemonsLoading).oldPokemonsList;
          pokemons.addAll(pokemon);
          log('List length: ${pokemons.length.toString()}');
          emit(PokemonsLoaded(pokemons));
        },
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
