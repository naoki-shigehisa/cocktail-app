import 'package:flutter/material.dart';
import './ingredient.dart';
import '../api/cockhome.dart';

class RecipesNotifier extends ChangeNotifier {
  final Map<int, Recipe?> _recipeMap = {};

  Map<int, Recipe?> get recipes => _recipeMap;

  void addRecipe(Recipe recipe) {
    _recipeMap[recipe.id] = recipe;
    notifyListeners();
  }

  void fetchRecipe(int id) async {
    _recipeMap[id] = null;
    addRecipe(await fetchRecipeFromApi(id));
  }

  Recipe? byId(int id) {
    if (!_recipeMap.containsKey(id)) {
      fetchRecipe(id);
    }
    return _recipeMap[id];
  }
}

class Recipe {
  final int id;
  final String name;
  final String nameEn;
  final String description;
  final String thumbnailUrl;
  final List<Ingredient> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.thumbnailUrl,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsToList(dynamic ingredients) {
      List<Ingredient> ret = [];
      for (int i = 0; i < ingredients.length; i++) {
        ret.add(Ingredient.fromJson(ingredients[i]));
      }
      return ret;
    }

    return Recipe(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      description: json['description'],
      thumbnailUrl: json['thumbnail_url'],
      ingredients: ingredientsToList(json['recipe_materials']),
    );
  }
}
