import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';

class RecipeStepParams {
  final int stepNumber;
  final String title;
  final String description;
  final String mediaPath;
  final List<StepProcessEntity> processList;
  final int duration;
  RecipeStepParams(
      {required this.stepNumber,
      required this.title,
      required this.description,
      required this.mediaPath,
      required this.processList,
      required this.duration});
}
