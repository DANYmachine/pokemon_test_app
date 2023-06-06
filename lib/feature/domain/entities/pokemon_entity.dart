import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double height;
  final double weight;
  final List<String> types;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.types,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        image,
        height,
        weight,
        types,
      ];
}
