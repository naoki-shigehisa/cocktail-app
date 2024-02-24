import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cockhome/const/api.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/model/ingredient.dart';

Future<Recipe> fetchRecipeFromApi(int id) async {
  final response = await http.get(Uri.parse('$cockhomeApiRoute/v1/recipes/$id.json'));
  if (response.statusCode == 200) {
    return Recipe.fromJson(jsonDecode(response.body)['recipe']);
  } else {
    throw Exception('Failed to load recipe');
  }
}

Future<List<Recipe>> fetchRecipesFromApi() async {
  final response = await http.get(Uri.parse('$cockhomeApiRoute/v1/recipes.json'));
  if (response.statusCode == 200) {
    final List<dynamic> recipes = jsonDecode(response.body)['recipes'];
    List<Recipe> ret = [];
    for (int i = 0; i < recipes.length; i++) {
      ret.add(Recipe.fromJson(recipes[i]));
    }
    return ret;
  } else {
    throw Exception('Failed to load recipes');
  }
}

Future<List<Ingredient>> fetchIngredientsFromApi() async {
  final response = await http.get(Uri.parse('$cockhomeApiRoute/v1/materials.json'));
  if (response.statusCode == 200) {
    final List<dynamic> ingredients = jsonDecode(response.body)['materials'];
    List<Ingredient> ret = [];
    for (int i = 0; i < ingredients.length; i++) {
      ret.add(Ingredient.fromJson(ingredients[i]));
    }
    return ret;
  } else {
    throw Exception('Failed to load ingredients');
  }
}
