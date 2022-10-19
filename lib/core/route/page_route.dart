class R {
  R._();

  static const String init = RoutePath.category;

  static String products(String category) => '/category/$category';

  static String product(String category, String product) =>
      '/category/$category/$product';
}

class RoutePath {
  RoutePath._();

  static const category = '/category';
  static const products = ':products';
  static const product = ':product';
}
