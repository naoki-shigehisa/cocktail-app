import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/model/search_condition.dart';
import 'package:cockhome/view/screens/recipe_list/recipe_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final recipesNotifier = RecipesNotifier();
  final searchConditionsNotifier = SearchConditionsNotifier();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<RecipesNotifier>(create: (context) => recipesNotifier),
      ChangeNotifierProvider<SearchConditionsNotifier>(create: (context) => searchConditionsNotifier),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cockhome',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFF5B2AC),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipeList();
  }
}
