import 'package:delimeals/pages/filters_page.dart';
import 'package:delimeals/pages/tabs_page.dart';

import '/pages/meal_detail_page.dart';
import 'pages/categories_meals_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE5E0D8)),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
              ),
              titleLarge: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>TabsPage(),
        CategoriesMealsPage.routeName:(context)=> CategoriesMealsPage(),
        MealDetailPage.routeName : (context)=>MealDetailPage(),
        FiltersPage.routeName:(context)=>FiltersPage(),
      },
    );
  }
}
