import 'package:pokemon_test_app/feature/domain/entities/type_entity.dart';

class TypeModel extends TypeEntity {
  const TypeModel({
    required types,
  }) : super(types: types);

  static List<String> fromJson(Map<String, dynamic> json) {
    List<String> types = [];
    for (var type in json['types']) {
      types.add(type['type']['name']);
    }
    return types;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': types,
    };
  }

  @override
  String toString() {
    return '$types';
  }
}
