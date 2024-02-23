import 'package:flutter/material.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/view/widgets/section_title.dart';

class HowToMake extends StatelessWidget {
  final Recipe recipe;

  const HowToMake({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: '作り方'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              {
                'title': '技法',
                'content': recipe.technique,
              },
              {
                'title': 'グラス',
                'content': recipe.type,
              },
              {
                'title': '氷',
                'content': recipe.isIce ? "あり" : "なし",
              },
            ].map((item) => Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[350]!,
                    width: 2.0,
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Text(
                    item['title']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                title: Text(
                  item['content']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recipe.recipeSteps.map((step) => ListTile(
              leading: Container(
                width: 25,
                child: Text(
                  step.order.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              title: Text(
                step.content,
                style: const TextStyle(fontSize: 16),
              ),
              trailing: step.thumbnailUrl != null ? Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      step.thumbnailUrl!,
                    ),
                  ),
                ),
              ) : null,
            )).toList(),
          ),
        ),
      ],
    );
  }
}
