import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/feature/new/data/models/ingredient_model.dart';
import 'package:sharecipe/feature/new/data/models/recipe_step_model.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';

class RecipeDetailsModel extends RecipeDetailsEntity {
  final int id;
  final String title;
  final String description;
  final String cover;
  final List<RecipeStepEntity> steps;
  final List<IngredientEntity> ingredients;

  RecipeDetailsModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.cover,
      required this.steps,
      required this.ingredients})
      : super(
            id: id,
            title: title,
            description: description,
            cover: cover,
            steps: steps,
            ingredients: ingredients);

  factory RecipeDetailsModel.fromJson(Map json) {
    List<RecipeStepEntity> stepsList = [];
    List<IngredientEntity> ingredientsList = [];
    for (Map step in json['steps']) {
      stepsList.add(RecipeStepModel.fromJson(step));
    }
    for (Map ingredient in json['ingredients']) {
      ingredientsList.add(IngredientModel.fromJson(ingredient));
    }
    return RecipeDetailsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        cover: json['cover'],
        steps: stepsList,
        ingredients: ingredientsList);
  }
}
