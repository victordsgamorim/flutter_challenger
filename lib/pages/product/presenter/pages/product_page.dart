import 'package:flutter/material.dart';
import 'package:flutter_challenger/core/common/sliver_app_bar.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/presenter/widgets/product_image.dart';
import 'package:flutter_challenger/pages/product/presenter/widgets/product_item_content.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBarDefault(title: product.title),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              sliver: SliverToBoxAdapter(
                  child: ProductImage(
                      image: product.image, rate: product.rating.rate)),
            ),
            SliverToBoxAdapter(
              child: ProductItemContent(product: product),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.white,
          ),
          label: const Text(
            "ADD TO CART",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
