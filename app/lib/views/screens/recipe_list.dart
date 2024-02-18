import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/recipe.dart';
import './recipe_detail.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesNotifier>(
      builder: (context, recipes, child) {
        return Scaffold(
          body: SafeArea(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                Recipe? recipe = recipes.byId(index + 1);

                if (recipe != null) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            recipe!.thumbnailUrl,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      recipe!.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(recipe!.ingredients.map((e) => e.name).join(' ')),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => RecipeDetail(id: recipe.id),
                        ),
                      ),
                    },
                  );
                } else {
                  return const ListTile(title: Text('...'));
                }
              },
            ),
          ),
        );
      },
    );
  }
}
