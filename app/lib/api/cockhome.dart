import 'dart:convert';
import 'package:http/http.dart' as http;
import '../const/api.dart';
import '../model/recipe.dart';

Future<Recipe> fetchRecipeFromApi(int id) async {
  final response = await http.get(Uri.parse('$cockhomeApiRoute/v1/recipes/$id.json'));
  if (response.statusCode == 200) {
    return Recipe.fromJson(jsonDecode(response.body)['recipe']);
  } else {
    throw Exception('Failed to load recipe');
  }
}

// Future<List<Recipe>> fetchRecipesFromApi() async {
//   final response = await http.get(Uri.parse('$cockhomeApiRoute/v1/recipes.json'));
//   if (response.statusCode == 200) {
//     final List<dynamic> recipes = jsonDecode(response.body)['recipes'];
//     List<Recipe> ret = [];
//     for (int i = 0; i < recipes.length; i++) {
//       ret.add(Recipe.fromJson(recipes[i]));
//     }
//     return ret;
//   } else {
//     throw Exception('Failed to load recipes');
//   }
// }
