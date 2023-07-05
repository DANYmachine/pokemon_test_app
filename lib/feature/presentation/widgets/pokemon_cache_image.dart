import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonCacheImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  const PokemonCacheImage({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      height: size,
      width: size,
      placeholderBuilder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
