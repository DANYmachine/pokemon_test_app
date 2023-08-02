import 'package:flutter/cupertino.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_svg/svg.dart';

class PokemonCacheImage extends StatefulWidget {
  final String imageUrl;
  final double size;
  const PokemonCacheImage({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  State<PokemonCacheImage> createState() => _PokemonCacheImageState();
}

class _PokemonCacheImageState extends State<PokemonCacheImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.contains('.svg')) {
      return SvgPicture.network(
        widget.imageUrl,
        height: widget.size,
        width: widget.size,
        placeholderBuilder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(30.0),
            child: const CupertinoActivityIndicator(),
          );
        },
      );
    } else if (widget.imageUrl.contains('.png')) {
      return Img(
        widget.imageUrl,
        height: widget.size,
        width: widget.size,
        placeholder: Container(
          child: const CupertinoActivityIndicator(),
        ),
      );
    }
    return SizedBox(
      height: widget.size,
    );
  }
}
