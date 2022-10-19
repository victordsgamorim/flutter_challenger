import 'package:flutter/material.dart';

class SliverGridDefault extends StatelessWidget {
  final SliverChildBuilderDelegate delegate;
  final int childCount;

  const SliverGridDefault(
      {super.key, required this.delegate, required this.childCount});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, mainAxisSpacing: 8, crossAxisSpacing: 8),
        delegate: delegate,
      ),
    );
  }
}
