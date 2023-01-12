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
  const NewBlocState(
      {required this.selectedImgPath,
      required this.title,
      required this.description,
      required this.searchText,
      required this.selectedIngredients,
      required this.ingredientStatus,
      required this.functionsStatus,
      required this.steps,
      required this.currentStepProcessList});

  NewBlocState copyWith(
      {String? newImgPath,
      String? newTitle,
      String? newDescription,
      String? search_text,
      List<IngredientEntity>? selected_ingredients,
      NewBlocStatus? ingredient_status,
      NewBlocStatus? function_status,
      List<RecipeStepEntity>? new_steps,
      List<StepProcessEntity>? current_step_process_list}) {
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
            current_step_process_list ?? currentStepProcessList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        selectedImgPath,
        title,
        description,
        selectedIngredients,
        ingredientStatus,
        searchText,
        functionsStatus,
        steps,
        currentStepProcessList
      ];
}
