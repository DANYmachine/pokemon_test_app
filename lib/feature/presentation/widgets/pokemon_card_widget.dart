import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_details_bloc/get_details_bloc.dart';

import '../../../service_locator.dart';
import '../pages/details_page.dart';
import 'pokemon_cache_image.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var img = pokemon.url;
    var imgUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';

    img = imgUrl + pokemon.url.split('/')[6] + '.png';
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<GetDetailsBloc>(
                    create: (context) =>
                        sl<GetDetailsBloc>()..add(GetDetails(url: pokemon.url)),
                  ),
                ],
                child: const PokemonDetailsPage(),
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(59, 158, 158, 158),
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PokemonCacheImage(
                imageUrl: img,
                size: 80,
              ),
              Center(child: Text(pokemon.name.toUpperCase())),
            ],
          ),
        ),
      ),
    );
  }
}
