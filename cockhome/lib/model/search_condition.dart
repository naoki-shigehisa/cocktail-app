import 'package:flutter/material.dart';
import 'package:cockhome/model/ingredient.dart';
import 'package:cockhome/api/cockhome.dart';

class SearchConditionsNotifier extends ChangeNotifier {
  final List<Ingredient> _ingredients = [];
  final List<int> _selectedIngredientIds = [];

  List<Ingredient> get ingredients => _ingredients;
  List<int> get selectedIngredientIds => _selectedIngredientIds;

  void _fetchIngredients() async {
    _ingredients.clear();
    _ingredients.addAll(await fetchIngredientsFromApi());
    notifyListeners();
  }

  void selectIngredient(int id) {
    if (!_selectedIngredientIds.contains(id)) {
      _selectedIngredientIds.add(id);
      notifyListeners();
    }
  }

  void unselectIngredient(int id) {
    if (_selectedIngredientIds.contains(id)) {
      _selectedIngredientIds.remove(id);
      notifyListeners();
    }
  }

  void clearSelectedIngredients() {
    _selectedIngredientIds.clear();
    notifyListeners();
  }

  List<Ingredient> allIngredients() {
    if (_ingredients.isEmpty) {
      _fetchIngredients();
    }
    return _ingredients;
  }
}