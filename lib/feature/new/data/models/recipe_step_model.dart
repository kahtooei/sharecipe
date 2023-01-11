import 'package:sharecipe/core/params/recipe_step_params.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';

class RecipeStepModel extends RecipeStepEntity {
  final int id;
  final int stepNumber;
  final String title;
  final String description;
  final String mediaLink;
  final List<StepProcessEntity> processList;
  final int duration;
  const RecipeStepModel(
      {required this.id,
      required this.stepNumber,
      required this.title,
      required this.description,
      required this.mediaLink,
      required this.processList,
      required this.duration})
      : super(
            id: id,
            stepNumber: stepNumber,
            title: title,
            description: description,
            mediaLink: mediaLink,
            processList: processList,
            duration: duration);

  factory RecipeStepModel.fromJson(Map json) {
    return RecipeStepModel(
        id: json['id'],
        stepNumber: json['stepNumber'],
        title: json['title'],
        description: json['description'],
        mediaLink: json['mediaLink'],
        processList: json['processList'],
        duration: json['duration']);
  }

  factory RecipeStepModel.createTemp(RecipeStepParams params) {
    return RecipeStepModel(
        id: params.stepNumber,
        stepNumber: params.stepNumber,
        title: params.title,
        description: params.description,
        mediaLink: params.mediaPath,
        processList: params.processList,
        duration: params.duration);
  }
}
