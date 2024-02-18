import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/recipe.dart';
import '../widgets/_common/section_title.dart';

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
                    SectionTitle(title: '材料'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recipe.ingredients.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[350]!,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                recipe.ingredients[index].name,
                                style: const TextStyle(fontSize: 16),
                              ),
                              trailing: Text(
                                '${recipe.ingredients[index].amount}${recipe.ingredients[index].unit}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SectionTitle(title: '作り方'),
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
