import 'package:pokemon_test_app/feature/domain/entities/details_image_entity.dart';

class DetailsImageModel extends DetailImageEntity {
  const DetailsImageModel({required image}) : super(image: image);

  factory DetailsImageModel.fromJson(Map<String, dynamic> json) {
    return DetailsImageModel(image: json['front_default']);
  }

  Map<String, dynamic> toJson() {
    return {'image': image};
  }

  @override
  String toString() {
    return 'Image: $image';
  }
}
