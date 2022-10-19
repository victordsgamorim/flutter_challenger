import 'dart:convert';

import 'package:flutter_challenger/core/error/exception.dart';
import 'package:flutter_challenger/core/util/constants/app_messages.dart';
import 'package:flutter_challenger/core/util/constants/app_url.dart';
import 'package:flutter_challenger/pages/product/data/model/product_model.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDatasource {
  Future<List<Product>> getProducts(String category);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final http.Client _client;

  ProductRemoteDatasourceImpl(this._client);

  @override
  Future<List<Product>> getProducts(String category) async {
    final response = await _client.get(
      AppUrl.product(category),
      headers: AppUrl.defaultHeader,
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded
          .map<Product>((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw ServerException(message: Messages.server.error);
    }
  }
}
