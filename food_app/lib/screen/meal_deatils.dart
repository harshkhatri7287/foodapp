import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';

class MealDeatilsScreen extends StatelessWidget {
  const MealDeatilsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover,),
          SizedBox(height: 14,),
          Text('Ingredients...', style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary
          ),),
          SizedBox(height: 8,),
          for (final ingredient in meal.ingredients)
            Text(ingredient,  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.tertiary)),
          SizedBox(height: 10,),
          Text('Steps...', style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary
          ),),
          SizedBox(height: 8,),
          for (final step in meal.steps)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(step,  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.tertiary)),
            ),
        ],),
      )
    );
  }
}