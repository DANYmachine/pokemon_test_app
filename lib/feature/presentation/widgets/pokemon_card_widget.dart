import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_details_bloc/get_details_bloc.dart';
import '../../../service_locator.dart';
import '../pages/details_page.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(pokemon.url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<GetDetailsBloc>(
                    create: (context) => sl<GetDetailsBloc>()..add(GetDetails(url: pokemon.url)),
                  ),
                ],
                child: PokemonDetailsPage(),
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
          child: Center(child: Text(pokemon.name.toUpperCase())),
        ),
      ),
    );
  }
}
