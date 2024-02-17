import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/recipe.dart';

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
      title: 'Flutter Demo',
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
    return Consumer<RecipesNotifier>(
      builder: (context, recipes, child) {
        Recipe? recipe = recipes.byId(1);

        if (recipe != null) {
          return Scaffold(
            body: Center(
              child: Text(
                recipe.name,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('...'),
            ),
          );
        }
      },
    );
  }
}
