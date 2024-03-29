import 'package:flutter/material.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/view/widgets/section_title.dart';

class Ingredients extends StatelessWidget {
  final Recipe recipe;

  const Ingredients({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: '材料'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
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
      ],
    );
  }
}