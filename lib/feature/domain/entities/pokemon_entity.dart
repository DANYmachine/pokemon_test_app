import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String url;
  final String image;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        image,
      ];
}
