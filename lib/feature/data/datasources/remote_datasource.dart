import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_test_app/feature/data/models/details_image_model.dart';
import 'package:pokemon_test_app/feature/data/models/details_model.dart';
import 'package:pokemon_test_app/feature/data/models/pokemon_model.dart';
import 'package:pokemon_test_app/feature/data/models/type_model.dart';

import '../../../core/error/exception.dart';

//api
//get all: https://pokeapi.co/api/v2/pokemon?offset=20&limit=20
//get info about certain: https://pokeapi.co/api/v2/pokemon/${id}/

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons(int page);
  Future<DetailsModel> getDetails(int id);
}

class PokemonRemoteDataSourceImpl extends PokemonRemoteDataSource {
  final Dio dio;
  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getAllPokemons(int page) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon?offset=${(page - 1) * 20}&limit=20',
    );
    if (response.statusCode == 200) {
      List<PokemonModel> models = [];

      final pokemons = json.decode('$response');
      for (var pokemon in pokemons['results']) {
        String str =
            pokemon['url'].replaceAll('https://pokeapi.co/api/v2/pokemon/', '');
        str = str.replaceAll('/', '');
        int id = int.parse(str);
        str =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$str.png';
        models.add(PokemonModel(
          id: id,
          name: pokemon['name'].toString().toUpperCase(),
          url: pokemon['url'],
          image: str,
        ));
      }
      return models;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailsModel> getDetails(int id) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/$id',
    );
    if (response.statusCode == 200) {
      final pokemon = json.decode('$response');
      return DetailsModel(
          height: pokemon['height'],
          weight: pokemon['weight'],
          image: DetailsImageModel.fromJson(
            pokemon['sprites']['other']['dream_world'],
          ),
          types: TypeModel.fromJson(pokemon));
    } else {
      throw ServerException();
    }
  }
}
