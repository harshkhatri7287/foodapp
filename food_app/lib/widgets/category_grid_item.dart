import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectedCategory});
  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onSelectedCategory();},
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(colors: [category.color.withAlpha(255), category.color.withAlpha(100)], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white,
        ),),
      ),
    );
  }
}