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
      height: 350,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Consumer<SearchConditionsNotifier>(
          builder: (context, searchConditions, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
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
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        searchConditions.clearSelectedIngredients();
                      },
                      child: const Text('選択解除'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('決定'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      )
    );
  }
}
