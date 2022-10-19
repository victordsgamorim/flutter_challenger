import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/core/common/sliver_app_bar.dart';
import 'package:flutter_challenger/core/di/di.dart';
import 'package:flutter_challenger/pages/product/presenter/bloc/product_bloc.dart';
import 'package:flutter_challenger/pages/product/presenter/widgets/product_list.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  const ProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductBloc>(),
      child: ProductContent(category: category),
    );
  }
}

class ProductContent extends StatefulWidget {
  final String category;

  const ProductContent({super.key, required this.category});

  @override
  State<ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  late final ProductBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ProductBloc>(context);
    _bloc.add(GetProductEvent(widget.category.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarDefault(title: widget.category),
          SliverProductList(category: widget.category)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
