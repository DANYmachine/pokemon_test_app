import 'package:pokemon_test_app/feature/data/models/details_image_model.dart';
import 'package:pokemon_test_app/feature/data/models/type_model.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';
import 'dart:convert' as convert;

class DetailsModel extends DetailsEntity {
  const DetailsModel({
    required image,
    required height,
    required weight,
    required types,
  }) : super(
          image: image,
          height: height,
          weight: weight,
          types: types,
        );

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      image:
          DetailsImageModel.fromJson(json['sprites']['other']['dream_world']),
      height: json['height'],
      weight: json['weight'],
      types: (convert.jsonDecode(json['types']) as List)
          .map((e) => TypeModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'height': height,
      'weight': weight,
      'types': types,
    };
  }

  @override
  String toString() {
    return '$image\t$height\t$weight\t$types';
  }
}
