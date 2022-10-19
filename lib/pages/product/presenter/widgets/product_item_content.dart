import 'package:flutter/material.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:intl/intl.dart';

class ProductItemContent extends StatelessWidget {
  final Product product;

  const ProductItemContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _ProductDescription(
              title: product.title,
              description: product.description,
            ),
          ),
          Expanded(child: _ProductPrice(price: product.price))
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String title;
  final String description;

  const _ProductDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20)),
        const SizedBox(height: 10),
        Text(description)
      ],
    );
  }
}

class _ProductPrice extends StatelessWidget {
  final double price;

  const _ProductPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
          NumberFormat.simpleCurrency(locale: "pt-PT", decimalDigits: 2)
              .format(price),
          maxLines: 1,
          style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 26, color: Theme.of(context).primaryColorLight)),
    );
  }
}
