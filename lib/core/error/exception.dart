class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class InternetException implements Exception {}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}
