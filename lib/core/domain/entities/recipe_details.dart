import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';

class RecipeDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String cover;
  final List<RecipeStepEntity> steps;
  RecipeDetailsEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.cover,
      required this.steps});

  @override
  List<Object?> get props => [id, title, description, cover, steps];

  String toJson() {
    String stepsJson = "";
    for (RecipeStepEntity step in steps) {
      stepsJson += "${step.toJson()},";
    }
    return """
    {
      "id": "$id",
      "title: "$title",
      "description": "$description",
      "cover": "$cover",
      "steps": [$stepsJson]
    }
    """;
  }
}
