import 'package:delimeals/models/meals.dart';
import 'package:delimeals/widgets/meal_item.dart';

import '../dummy-data.dart';
import 'package:flutter/material.dart';

class CategoriesMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoriesMealsPage> createState() => _CategoriesMealsPageState();
}

class _CategoriesMealsPageState extends State<CategoriesMealsPage> {
  late  String categoryTitle;
  late List<Meal> categoryMeals;

  
  @override
  void didChangeDependencies() {
    final routesArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>; //из-за того что ModalRoute, а так бы подошло и initState
    final categoryId = routesArg['id'];
     categoryTitle = routesArg['title']!;
     categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String mealId){
    setState(() {
      categoryMeals.removeWhere((meal)=>meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                removeItem: _removeItem,
                );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
