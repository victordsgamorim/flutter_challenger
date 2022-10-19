import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final IconData icon;
  final String name;

  const Category({required this.name, required this.icon});

  @override
  List<Object?> get props => [name, icon];
}
