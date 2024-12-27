import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/screen/meals.dart';
import 'package:food_app/widgets/category_grid_item.dart';
import 'package:food_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealsScreen(title: category.title, meals: filteredMeals);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final allCategories = availableCategories;
    return Scaffold(
      appBar: AppBar(
        title: Text('Food-E'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.fastfood_rounded))
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        children: allCategories.map((element) {
          return CategoryGridItem(
            category: element,
            onSelectedCategory: () {
              _selectedCategory(context, element);
            },
          );
        }).toList(),
      ),
    );
  }
}
