import 'package:equatable/equatable.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_image_entity.dart';

class DetailsEntity extends Equatable {
  final DetailImageEntity image;
  final int height;
  final int weight;
  final List<String> types;

  const DetailsEntity({
    required this.image,
    required this.height,
    required this.weight,
    required this.types,
  });

  @override
  List<Object?> get props => [
        image,
        height,
        weight,
        types,
      ];
}
