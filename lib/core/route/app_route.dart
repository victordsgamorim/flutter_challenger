import 'package:flutter/material.dart';
import 'package:flutter_challenger/core/route/page_name.dart';
import 'package:flutter_challenger/core/route/page_route.dart';
import 'package:flutter_challenger/pages/category/presenter/page/category_page.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/presenter/pages/product_page.dart';
import 'package:flutter_challenger/pages/product/presenter/pages/products_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static GoRouter router = GoRouter(
    initialLocation: RoutePath.category,
    routes: [
      GoRoute(
        name: PageName.category,
        path: RoutePath.category,
        builder: (context, state) => const CategoryPage(),
        routes: [
          GoRoute(
              name: PageName.products,
              path: RoutePath.products,
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child:
                        ProductsPage(category: state.params["products"] ?? ""),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: animation.drive(
                          Tween(begin: const Offset(1, 0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.ease))),
                      child: child,
                    ),
                  ),
              routes: [
                GoRoute(
                  name: PageName.product,
                  path: RoutePath.product,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: ProductPage(
                      product: state.extra as Product,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: animation.drive(
                          Tween(begin: const Offset(1, 0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.ease))),
                      child: child,
                    ),
                  ),
                )
              ]),
        ],
      ),
    ],
    // errorBuilder: (context, state) => const ErrorPage(),
  );
}
