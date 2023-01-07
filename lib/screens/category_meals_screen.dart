import 'package:flutter/material.dart';
import 'package:food_menu/models/category.dart';
import 'package:food_menu/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'] as String;
    final String categoryId = routeArgs['id'] as String;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("${categoryTitle}")),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, affordability: categoryMeals[index].affordability, complexity: categoryMeals[index].complexity, duration: categoryMeals[index].duration, id:categoryMeals[index].id);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
