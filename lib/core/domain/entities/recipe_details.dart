import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';

class RecipeDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String cover;
  final List<RecipeStepEntity> steps;
  final List<IngredientEntity> ingredients;
  const RecipeDetailsEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.cover,
      required this.steps,
      required this.ingredients});

  @override
  List<Object?> get props => [id, title, description, cover, steps];

  String toJson() {
    String stepsJson = "";
    String ingredientsJson = "";
    for (RecipeStepEntity step in steps) {
      stepsJson += "${step.toJson()},";
    }
    for (IngredientEntity ingredient in ingredients) {
      ingredientsJson += "${ingredient.toJson()},";
    }
    return """
    {
      "id": "$id",
      "title: "$title",
      "description": "$description",
      "cover": "$cover",
      "steps": [$stepsJson],
      "ingredients": [$ingredientsJson]
    }
    """;
  }
}
