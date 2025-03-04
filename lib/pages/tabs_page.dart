import 'package:delimeals/widgets/main_drawer.dart';

import './categories_page.dart';
import './favorites_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesPage(), 'title': 'Meals'},
    {'page': FavoritesPage(), 'title': 'Your meals'},
  ];

  int _selectedIndexPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndexPage]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndexPage]['page'] as Widget, 
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        onTap: _selectPage,
        currentIndex: _selectedIndexPage,
      ),
    );
  }
}