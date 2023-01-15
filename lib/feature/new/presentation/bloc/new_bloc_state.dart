part of 'new_bloc_bloc.dart';

class NewBlocState extends Equatable {
  final String selectedImgPath;
  final String title;
  final String description;
  final String searchText;
  final NewBlocStatus ingredientStatus;
  final List<IngredientEntity> selectedIngredients;
  final NewBlocStatus functionsStatus;
  final List<RecipeStepEntity> steps;
  final List<StepProcessEntity> currentStepProcessList;
  final String currentStepTitle;
  final String currentStepDescription;
  final String currentStepMedia;
  final NewBlocStatus saveStatus;
  const NewBlocState(
      {required this.selectedImgPath,
      required this.title,
      required this.description,
      required this.searchText,
      required this.selectedIngredients,
      required this.ingredientStatus,
      required this.functionsStatus,
      required this.steps,
      required this.currentStepProcessList,
      required this.currentStepTitle,
      required this.currentStepDescription,
      required this.currentStepMedia,
      required this.saveStatus});

  NewBlocState copyWith(
      {String? newImgPath,
      String? newTitle,
      String? newDescription,
      String? search_text,
      List<IngredientEntity>? selected_ingredients,
      NewBlocStatus? ingredient_status,
      NewBlocStatus? function_status,
      List<RecipeStepEntity>? new_steps,
      List<StepProcessEntity>? current_step_process_list,
      String? current_title,
      String? current_description,
      String? current_media,
      NewBlocStatus? save_status}) {
    return NewBlocState(
        selectedImgPath: newImgPath ?? selectedImgPath,
        title: newTitle ?? title,
        description: newDescription ?? description,
        searchText: search_text ?? searchText,
        selectedIngredients: selected_ingredients ?? selectedIngredients,
        ingredientStatus: ingredient_status ?? ingredientStatus,
        functionsStatus: function_status ?? functionsStatus,
        steps: new_steps ?? steps,
        currentStepProcessList:
            current_step_process_list ?? currentStepProcessList,
        currentStepTitle: current_title ?? currentStepTitle,
        currentStepDescription: current_description ?? currentStepDescription,
        currentStepMedia: current_media ?? currentStepMedia,
        saveStatus: save_status ?? saveStatus);
  }

  @override
  List<Object?> get props => [
        selectedImgPath,
        title,
        description,
        selectedIngredients,
        ingredientStatus,
        searchText,
        functionsStatus,
        steps,
        currentStepProcessList,
        currentStepTitle,
        currentStepDescription,
        currentStepMedia,
        saveStatus
      ];
}
