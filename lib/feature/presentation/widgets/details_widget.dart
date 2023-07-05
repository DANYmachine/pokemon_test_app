import 'package:flutter/material.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';

class PokemonDetails extends StatelessWidget {
  final DetailsEntity details;
  const PokemonDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(details.id.toString()),
            Text(details.height.toString()),
          ],
        ),
      ),
    );
  }
}
