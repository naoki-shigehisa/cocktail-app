import 'package:flutter/material.dart';

class RecipeStep {
  final int id;
  final int order;
  final String content;
  final String thumbnailUrl;

  RecipeStep({
    required this.id,
    required this.order,
    required this.content,
    required this.thumbnailUrl,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      id: json['id'],
      order: json['order'],
      content: json['content'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}
