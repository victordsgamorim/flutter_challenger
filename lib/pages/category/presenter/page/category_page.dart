import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/core/common/sliver_app_bar.dart';
import 'package:flutter_challenger/core/di/di.dart';
import 'package:flutter_challenger/pages/category/presenter/bloc/category_bloc.dart';
import 'package:flutter_challenger/pages/category/presenter/widget/category_list.dart';
import 'package:flutter_challenger/pages/category/presenter/widget/promo_header.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoryBloc>(),
      child: const CategoryContent(),
    );
  }
}

class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  late final CategoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CategoryBloc>(context);
    _bloc.add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarDefault(title: 'Welcome'),
          SliverToBoxAdapter(child: PromoHeader()),
          SliverCategoryList()
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
