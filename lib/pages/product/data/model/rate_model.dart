import 'package:flutter_challenger/pages/product/domain/entities/rate.dart';

class RateModel extends Rate {
  const RateModel({required super.rate, required super.count});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      rate: json["rate"].toDouble(),
      count: json["count"],
    );
  }
}
