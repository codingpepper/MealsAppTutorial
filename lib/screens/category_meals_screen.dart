import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // Gets the Title and Id from The CategoryItem.dart
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // Then this final categoryMeals grabs the data from Dummy for every
    // Meal which contains the categoryId that was send from The Item
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                title: categoryMeals[i].title,
                imageUrl: categoryMeals[i].imageUrl,
                duration: categoryMeals[i].duration,
                complexity: categoryMeals[i].complexity,
                affordability: categoryMeals[i].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
