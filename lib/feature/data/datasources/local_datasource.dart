// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:pokemon_test_app/core/error/exception.dart';
import 'package:pokemon_test_app/feature/data/models/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  Future<List<PokemonModel>> getLastPokemonsFromCache();
  Future<void> pokemonsToCache(List<PokemonModel> pokemons);
}

const CACHED_POKEMONS_LIST = 'CACHED_POKEMONS_LIST';
/*
class LocalDatasourceImpl implements LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<List<PokemonModel>> getLastPokemonsFromCache() {
    final jsonPokemonsList = sharedPreferences.getStringList(
      CACHED_POKEMONS_LIST,
    );
    if (jsonPokemonsList!.isNotEmpty) {
      return Future.value(
        jsonPokemonsList
            .map(
              (pokemon) => PokemonModel.fromJson(
                json.decode(pokemon),
              ),
            )
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> pokemonsToCache(List<PokemonModel> pokemons) {
    final List<String> jsonPokemonsList = pokemons
        .map(
          (pokemon) => json.encode(
            pokemon.toJson(),
          ),
        )
        .toList();
    sharedPreferences.setStringList(CACHED_POKEMONS_LIST, jsonPokemonsList);
    log('Pokemons to cache: ${jsonPokemonsList.length}');
    return Future.value();
  }
}
*/