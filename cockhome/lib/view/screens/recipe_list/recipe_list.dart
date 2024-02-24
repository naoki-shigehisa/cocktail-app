import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/view/screens/recipe_detail/recipe_detail.dart';
import 'package:cockhome/view/screens/recipe_list/widgets/search_bottom_sheet.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesNotifier>(
      builder: (context, recipes, child) {
        List<Recipe> recipeList = recipes.all();

        return Scaffold(
          body: SafeArea(
            child: ListView.builder(
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                Recipe? recipe = recipeList[index];

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
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet<bool>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                builder: (BuildContext context) {
                  return SearchBottomSheet();
                },
              );
            },
            child: const Icon(Icons.search),
          ),
        );
      },
    );
  }
}
