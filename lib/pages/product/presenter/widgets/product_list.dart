import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/core/common/connection_error.dart';
import 'package:flutter_challenger/core/common/item_shimmer_loading.dart';
import 'package:flutter_challenger/core/common/messager.dart';
import 'package:flutter_challenger/core/common/sliver_grid_default.dart';
import 'package:flutter_challenger/core/route/page_route.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/presenter/bloc/product_bloc.dart';
import 'package:flutter_challenger/pages/product/presenter/widgets/product_rating.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SliverProductList extends StatelessWidget {
  final String category;

  const SliverProductList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
      if (state is ProductError) {
        snackBar(context, state.message);
      }
    }, builder: (context, state) {
      if (state is ProductLoading) {
        return SliverGridDefault(
          childCount: 4,
          delegate: SliverChildBuilderDelegate(
              (_, __) => const ItemShimmerLoading(),
              childCount: 4),
        );
      } else if (state is ProductSuccess) {
        return SliverGridDefault(
          childCount: 4,
          delegate: SliverChildBuilderDelegate(
              (_, index) => _ProductItem(
                    product: state.products[index],
                    category: category,
                  ),
              childCount: state.products.length),
        );
      } else if (state is ProductError) {
        return const SliverToBoxAdapter(child: ConnectionError());
      }

      return const SliverToBoxAdapter(child: SizedBox());
    });
  }
}

class _ProductItem extends StatelessWidget {
  final Product product;
  final String category;

  const _ProductItem(
      {super.key, required this.product, required this.category});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: InkWell(
        onTap: () {
          final p = product.title.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          GoRouter.of(context).go(
            R.product(category, p),
            extra: product,
          );
        },
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: product.image,
                  height: 100,
                  width: double.infinity,
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ProductRating(rating: product.rating.rate),
                ),
              ],
            ),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                NumberFormat.simpleCurrency(locale: "pt-PT", decimalDigits: 2)
                    .format(product.price),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).primaryColorLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
