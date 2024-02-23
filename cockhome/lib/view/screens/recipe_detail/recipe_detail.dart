import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/view/widgets/section_title.dart';
import 'package:cockhome/view/screens/recipe_detail/widgets/ingredients.dart';
import 'package:cockhome/view/screens/recipe_detail/widgets/how_to_make.dart';
import 'package:cockhome/view/screens/recipe_detail/widgets/basic_info.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesNotifier>(
      builder: (context, recipes, child) {
        Recipe? recipe = recipes.byId(id);

        if (recipe != null) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(recipe.name),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            recipe.thumbnailUrl,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.nameEn,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              recipe.name,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              recipe.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Ingredients(recipe: recipe),
                    HowToMake(recipe: recipe),
                    BasicInfo(recipe: recipe),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
