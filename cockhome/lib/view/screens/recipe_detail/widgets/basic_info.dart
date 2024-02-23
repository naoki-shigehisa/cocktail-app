import 'package:flutter/material.dart';
import 'package:cockhome/model/recipe.dart';
import 'package:cockhome/view/widgets/section_title.dart';

class BasicInfo extends StatelessWidget {
  final Recipe recipe;

  const BasicInfo({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: '基本情報'),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              {
                'title': 'アルコール',
                'content': '約${recipe.alcohol}%',
              },
              {
                'title': '色',
                'content': recipe.color,
              },
              {
                'title': '味',
                'content': recipe.taste,
              },
              {
                'title': 'タイプ',
                'content': recipe.type,
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
