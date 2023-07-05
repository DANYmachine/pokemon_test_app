import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon_test_app/feature/data/models/details_model.dart';
import 'package:pokemon_test_app/feature/data/models/pokemon_model.dart';

import '../../../core/error/exception.dart';

//api
//get all: https://pokeapi.co/api/v2/pokemon?offset=20&limit=20
//get info about certain: https://pokeapi.co/api/v2/pokemon/${id}/

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons(int page);
  Future<DetailsModel> getDetails(String url);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;
  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getAllPokemons(int page) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon?offset=${(page - 1) * 20}&limit=20');
    if (response.statusCode == 200) {
      final data = json.decode('$response');
      return (data['results'] as List).map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailsModel> getDetails(String url) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final data = json.decode('$response');
      return DetailsModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
