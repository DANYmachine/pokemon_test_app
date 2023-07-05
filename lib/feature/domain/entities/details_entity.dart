import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String image;
  final int height;
  final int weight;
  final List<String> types;

  const DetailsEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.image,
    required this.height,
    required this.weight,
    required this.types,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        image,
        height,
        weight,
        types,
      ];
}
