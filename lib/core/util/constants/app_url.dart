class AppUrl{
  AppUrl._internal();
  static final AppUrl _singleton = AppUrl._internal();
  factory AppUrl() => _singleton;

  static const String url = "https://fakestoreapi.com/";
  static Map<String, String> defaultHeader = {
    "Content-Type": "application/json",
  };

  static Uri _concat(String endpoint) => Uri.parse("$url$endpoint");
  static get category => _concat("products/categories");
  static product(String category) => _concat("products/category/$category");
}