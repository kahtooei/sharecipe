part of 'new_bloc_bloc.dart';

class NewBlocState extends Equatable {
  final String selectedImgPath;
  final String title;
  final String description;
  final String searchText;
  final IngredientBlocStatus ingredientStatus;
  final List<IngredientEntity> selectedIngredients;
  const NewBlocState(
      {required this.selectedImgPath,
      required this.title,
      required this.description,
      required this.searchText,
      required this.selectedIngredients,
      required this.ingredientStatus});

  NewBlocState copyWith(
      {String? newImgPath,
      String? newTitle,
      String? newDescription,
      String? search_text,
      List<IngredientEntity>? selected_ingredients,
      IngredientBlocStatus? ingredient_status}) {
    return NewBlocState(
        selectedImgPath: newImgPath ?? selectedImgPath,
        title: newTitle ?? title,
        description: newDescription ?? description,
        searchText: search_text ?? searchText,
        selectedIngredients: selected_ingredients ?? selectedIngredients,
        ingredientStatus: ingredient_status ?? ingredientStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        selectedImgPath,
        title,
        description,
        selectedIngredients,
        ingredientStatus,
        searchText
      ];
}
