import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  const DetailsModel({
    required id,
    required name,
    required icon,
    required image,
    required height,
    required weight,
    required types,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          image: image,
          height: height,
          weight: weight,
          types: types,
        );

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> types = [];
    for (var type in json['types']) {
      types.add(type['type']['name']);
    }
    return DetailsModel(
      id: json['id'],
      name: json['name'],
      icon: json['sprites']['front_default'],
      image: json['sprites']['other']['dream_world']['front_default'],
      height: json['height'],
      weight: json['weight'],
      types: types,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
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
