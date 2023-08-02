import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_all_pokemons_bloc/get_all_pokemons_bloc.dart';
import 'package:pokemon_test_app/feature/presentation/widgets/pokemon_card_widget.dart';

class PokemonsList extends StatelessWidget {
  final scrollController = ScrollController();
  PokemonsList({super.key});

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<GetAllPokemonsBloc>().add(GetPokemonsEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    bool isLoading = false;
    return BlocBuilder<GetAllPokemonsBloc, GetAllPokemonsState>(
      builder: (context, state) {
        List<PokemonEntity> pokemons = [];

        if (state is PokemonsLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PokemonsLoading) {
          pokemons = state.oldPokemonsList;
          isLoading = false;
        } else if (state is PokemonsLoaded) {
          pokemons = state.pokemonsList;
        } else if (state is PokemonsError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < pokemons.length) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: PokemonCard(pokemon: pokemons[index]),
                );
              } else {
                return _loadingIndicator();
              }
            },
            itemCount: pokemons.length + (isLoading ? 1 : 0),
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(child: CupertinoActivityIndicator()),
    );
  }
}
