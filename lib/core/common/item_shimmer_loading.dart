import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemShimmerLoading extends StatelessWidget {
  const ItemShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: const Card(
        child: SizedBox(height: 100, width: 200),
      ),
    );
  }
}
