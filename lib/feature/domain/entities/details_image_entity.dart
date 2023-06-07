import 'package:equatable/equatable.dart';

class DetailImageEntity extends Equatable {
  final String image;
  const DetailImageEntity({required this.image});

  @override
  List<Object?> get props => [image];
}
