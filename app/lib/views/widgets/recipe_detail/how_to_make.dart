import 'package:flutter/material.dart';
import '../../../model/recipe.dart';
import '../_common/section_title.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
      ],
    );
  }
}
