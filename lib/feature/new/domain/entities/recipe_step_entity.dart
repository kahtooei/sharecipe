import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';

class RecipeStepEntity extends Equatable {
  final int id;
  final int stepNumber;
  final String title;
  final String description;
  final String mediaLink;
  final List<StepProcessEntity> processList;
  final int duration;
  const RecipeStepEntity(
      {required this.id,
      required this.stepNumber,
      required this.title,
      required this.description,
      required this.mediaLink,
      required this.processList,
      required this.duration});

  @override
  List<Object?> get props =>
      [id, title, description, mediaLink, processList, duration, stepNumber];

  String toJson() {
    String processJson = "";
    for (StepProcessEntity process in processList) {
      processJson += "${process.toJson()},";
    }
    return """ 
    {
    "id": $id ,
    "stepNumber": $stepNumber ,
    "title":"$title",
    "description":"$description",
    "mediaLink":"$mediaLink",
    "processList":[$processJson],
    "duration": $duration
    }
    """;
  }
}
