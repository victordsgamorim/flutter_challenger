import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.amberAccent,
          ),
          Text(
            "$rating",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
