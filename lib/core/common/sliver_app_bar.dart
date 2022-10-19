import 'package:flutter/material.dart';

class SliverAppBarDefault extends StatelessWidget {
  final String title;

  const SliverAppBarDefault({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).primaryColor,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images/victor_photo.jpg")),
          ),
        ),
      ],
    );
  }
}
