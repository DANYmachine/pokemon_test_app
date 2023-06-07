import 'package:flutter/widgets.dart';
import 'package:pokemon_test_app/feature/domain/entities/pokemon_entity.dart';

import 'details_model.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required id,
    required name,
    required url,
    required image,
  }) : super(id: id, name: name, url: url, image: image);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'image': image,
    };
  }

  @override
  String toString() {
    return '\n$id\t$name\t$url\t$image';
  }
}
