import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenger/pages/product/presenter/widgets/product_rating.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final double rate;

  const ProductImage({super.key, required this.image, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: image,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ProductRating(rating: rate),
        )
      ],
    );
  }
}
