import 'package:flutter/material.dart';

class Ingredient {
  final int id;
  final String name;
  final String nameEn;
  final String description;
  final String thumbnailUrl;
  final String amazonUrl;
  final bool isAlcohol;
  final String unit;
  final int amount;
  final bool isOption;

  Ingredient({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.thumbnailUrl,
    required this.amazonUrl,
    required this.isAlcohol,
    required this.unit,
    required this.amount,
    required this.isOption,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      description: json['description'],
      thumbnailUrl: json['thumbnail_url'],
      amazonUrl: json['amazon_url'],
      isAlcohol: json['is_alcohol'],
      unit: json['unit'],
      amount: json['amount'],
      isOption: json['is_option'],
    );
  }
}
