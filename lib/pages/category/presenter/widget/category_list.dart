import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/core/common/connection_error.dart';
import 'package:flutter_challenger/core/common/item_shimmer_loading.dart';
import 'package:flutter_challenger/core/common/messager.dart';
import 'package:flutter_challenger/core/common/sliver_grid_default.dart';
import 'package:flutter_challenger/core/route/page_route.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:flutter_challenger/pages/category/presenter/bloc/category_bloc.dart';
import 'package:go_router/go_router.dart';

class SliverCategoryList extends StatelessWidget {
  const SliverCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
      if (state is CategoryError) {
        snackBar(context, state.message);
      }
    }, builder: (context, state) {
      if (state is CategoryLoading) {
        return SliverGridDefault(
          childCount: 4,
          delegate: SliverChildBuilderDelegate(
              (_, __) => const ItemShimmerLoading(),
              childCount: 4),
        );
      } else if (state is CategorySuccess) {
        return SliverGridDefault(
          childCount: state.categories.length,
          delegate: SliverChildBuilderDelegate(
            (_, index) => _CategoryItem(category: state.categories[index]),
            childCount: state.categories.length,
          ),
        );
      } else if (state is CategoryError) {
        return const SliverToBoxAdapter(child: ConnectionError());
      }
      return const SliverFillRemaining(child: SizedBox());
    });
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: () => GoRouter.of(context).go(R.products(category.name)),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
            ),
            child: FractionallySizedBox(
              widthFactor: .9,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: FittedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(category.icon),
                      ),
                    )),
                  ),
                  const Divider(color: Colors.white),
                  Expanded(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          category.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium,
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
