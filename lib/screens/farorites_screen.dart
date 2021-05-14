import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreens extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavoriteScreens(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Container(child: Text('No Favouites yet'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: favouriteMeals[i].id,
            title: favouriteMeals[i].title,
            imageUrl: favouriteMeals[i].imageUrl,
            duration: favouriteMeals[i].duration,
            complexity: favouriteMeals[i].complexity,
            affordability: favouriteMeals[i].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
