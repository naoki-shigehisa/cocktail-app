import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cockhome/model/search_condition.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({Key? key}) : super(key: key);

  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: SingleChildScrollView(
          child: Consumer<SearchConditionsNotifier>(
            builder: (context, searchConditions, child) {
              return Wrap(
                spacing: 5.0,
                children: searchConditions.allIngredients().map((ingredient) {
                  return FilterChip(
                    label: Text(ingredient.name),
                    selected: searchConditions.selectedIngredientIds.contains(ingredient.id),
                    backgroundColor: Colors.white,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    showCheckmark: false,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          searchConditions.selectIngredient(ingredient.id);
                        } else {
                          searchConditions.unselectIngredient(ingredient.id);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      )
    );
  }
}
