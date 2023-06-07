import 'package:equatable/equatable.dart';

class TypeEntity extends Equatable {
  final List<String> types;

  const TypeEntity({
    required this.types,
  });

  @override
  List<Object?> get props => [
        types,
      ];
}
