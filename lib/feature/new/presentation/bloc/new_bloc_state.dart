part of 'new_bloc_bloc.dart';

class NewBlocState extends Equatable {
  final String selectedImgPath;
  final String title;
  final String description;
  final List<IngredientEntity> ingredientsList;
  final List<IngredientEntity> selectedIngredients;
  const NewBlocState({
    required this.selectedImgPath,
    required this.title,
    required this.description,
    required this.ingredientsList,
    required this.selectedIngredients,
  });

  NewBlocState copyWith({
    String? newImgPath,
    String? newTitle,
    String? newDescription,
    List<IngredientEntity>? ingredients,
    List<IngredientEntity>? selected_ingredients,
  }) {
    return NewBlocState(
        selectedImgPath: newImgPath ?? selectedImgPath,
        title: newTitle ?? title,
        description: newDescription ?? description,
        ingredientsList: ingredients ?? ingredientsList,
        selectedIngredients: selected_ingredients ?? selectedIngredients);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        selectedImgPath,
        title,
        description,
        ingredientsList,
        selectedIngredients
      ];
}
