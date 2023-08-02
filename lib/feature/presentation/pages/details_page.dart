import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_details_bloc/get_details_bloc.dart';
import 'package:pokemon_test_app/feature/presentation/widgets/pokemon_cache_image.dart';

import '../widgets/details_widget.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({
    super.key,
  });

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<GetDetailsBloc, GetDetailsState>(
      builder: (context, state) {
        DetailsEntity? details;
        if (state is DetailsLoading) {
          isLoading = false;

          return Scaffold(
            body: _loadingIndicator(),
          );
        } else if (state is DetailsLoaded) {
          details = state.details;
          log(details.height.toString());
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                details.name.toUpperCase(),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.1),
                  SizedBox(
                    height: height * 0.2,
                    width: height * 0.2,
                    child: PokemonCacheImage(
                      imageUrl: details.image,
                      size: height * 0.2,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Text('Weight: ${details.weight} kg'),
                  Text('Height: ${details.height} m'),
                  Container(
                    height: height * 0.2,
                    padding: const EdgeInsets.all(50),
                    child: PokemonDetails(
                      details: details,
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is DetailsError) {
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
        return const SizedBox();
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
