part of 'get_all_pokemons_bloc.dart';

abstract class GetAllPokemonsState extends Equatable {
  const GetAllPokemonsState();

  @override
  List<Object> get props => [];
}

class PokemonsEmpty extends GetAllPokemonsState {
  @override
  List<Object> get props => [];
}

class PokemonsLoading extends GetAllPokemonsState {
  final List<PokemonEntity> oldPokemonsList;
  final bool isFirstFetch;

  const PokemonsLoading(this.oldPokemonsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPokemonsList];
}

class PokemonsLoaded extends GetAllPokemonsState {
  final List<PokemonEntity> pokemonsList;

  const PokemonsLoaded(this.pokemonsList);

  @override
  List<Object> get props => [pokemonsList];
}

class PokemonsError extends GetAllPokemonsState {
  final String message;

  const PokemonsError({required this.message});

  @override
  List<Object> get props => [message];
}
