import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/recipe.dart';
import './views/screens/recipe_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final recipesNotifier = RecipesNotifier();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<RecipesNotifier>(create: (context) => recipesNotifier),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
