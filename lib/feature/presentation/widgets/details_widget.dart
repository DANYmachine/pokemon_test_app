import 'package:flutter/material.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';

class PokemonDetails extends StatefulWidget {
  final DetailsEntity details;
  const PokemonDetails({super.key, required this.details});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.details.types.length,
        itemBuilder: (context, index) {
          return Text(
            widget.details.types[index].toUpperCase(),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
