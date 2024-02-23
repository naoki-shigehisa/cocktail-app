import 'package:flutter/material.dart';
import 'package:cockhome/model/ingredient.dart';
import 'package:cockhome/model/recipe_step.dart';
import 'package:cockhome/api/cockhome.dart';

class RecipesNotifier extends ChangeNotifier {
  final Map<int, Recipe?> _recipeMap = {};
  final List<Recipe> _recipeList = [];

  Map<int, Recipe?> get recipeMaps => _recipeMap;
  List<Recipe> get recipeList => _recipeList;

  void addRecipe(Recipe recipe) {
    _recipeMap[recipe.id] = recipe;
    notifyListeners();
  }

  void fetchRecipe(int id) async {
    _recipeMap[id] = null;
    addRecipe(await fetchRecipeFromApi(id));
  }

  void fetchRecipes() async {
    _recipeList.clear();
    _recipeList.addAll(await fetchRecipesFromApi());
    notifyListeners();
  }

  Recipe? byId(int id) {
    if (!_recipeMap.containsKey(id)) {
      fetchRecipe(id);
    }
    return _recipeMap[id];
  }

  List<Recipe> all() {
    if (_recipeList.isEmpty) {
      fetchRecipes();
    }
    return _recipeList;
  }
}

class Recipe {
  final int id;
  final String name;
  final String nameEn;
  final String description;
  final String thumbnailUrl;
  final List<Ingredient> ingredients;
  final List<RecipeStep> recipeSteps;
  final String? technique;
  final String? type;
  final bool? isIce;
  final int? alcohol;
  final String? taste;
  final String? color;

  Recipe({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.recipeSteps,
    required this.technique,
    required this.type,
    required this.isIce,
    required this.alcohol,
    required this.taste,
    required this.color,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsToList(dynamic ingredients) {
      List<Ingredient> ret = [];
      for (int i = 0; i < ingredients.length; i++) {
        ret.add(Ingredient.fromJson(ingredients[i]));
      }
      return ret;
    }

    List<RecipeStep> recipeStepsToList(dynamic recipeSteps) {
      if (recipeSteps == null) {
        return [];
      }

      List<RecipeStep> ret = [];
      for (int i = 0; i < recipeSteps.length; i++) {
        ret.add(RecipeStep.fromJson(recipeSteps[i]));
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
      recipeSteps: recipeStepsToList(json['recipe_steps']),
      technique: json['technique']?['name'] ?? null,
      type: json['type']?['name'] ?? null,
      isIce: json['is_ice'],
      alcohol: json['alcohol'],
      taste: json['taste']?['name'] ?? null,
      color: json['color']?['name'] ?? null,
    );
  }
}
