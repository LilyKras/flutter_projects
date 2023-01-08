import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favorites;
  FavoritesScreen(this._favorites);

  @override
  Widget build(BuildContext context) {
    return _favorites.isEmpty
        ? Center(child: Text('You have no favorites'))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                title: _favorites[index].title,
                imageUrl: _favorites[index].imageUrl,
                affordability: _favorites[index].affordability,
                complexity: _favorites[index].complexity,
                duration: _favorites[index].duration,
                id: _favorites[index].id,
              );
            },
            itemCount: _favorites.length,
          );
  }
}
