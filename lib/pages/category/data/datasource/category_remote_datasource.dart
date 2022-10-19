import 'dart:convert';

import 'package:flutter_challenger/core/error/exception.dart';
import 'package:flutter_challenger/core/util/constants/app_messages.dart';
import 'package:flutter_challenger/core/util/constants/app_url.dart';
import 'package:flutter_challenger/core/util/extensions/list_extension.dart';
import 'package:flutter_challenger/core/util/extensions/string_extension.dart';
import 'package:flutter_challenger/pages/category/data/model/category_model.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

const _icons = [
  FontAwesomeIcons.mobile,
  FontAwesomeIcons.ring,
  FontAwesomeIcons.person,
  FontAwesomeIcons.personDress,
];

abstract class CategoryRemoteDatasource {
  Future<List<Category>> getCategories();
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final http.Client _client;

  CategoryRemoteDatasourceImpl(this._client);

  @override
  Future<List<Category>> getCategories() async {
    final response = await _client.get(
      AppUrl.category,
      headers: AppUrl.defaultHeader,
    );

    if (response.statusCode == 200) {
      final categories = jsonDecode(response.body) as List;
      return categories
          .mapIndexed((category, index) => CategoryModel(
                name: category.toString().capitalize(),
                icon: _icons[index],
              ))
          .toList();
    } else {
      throw ServerException(message: Messages.server.error);
    }
  }
}
