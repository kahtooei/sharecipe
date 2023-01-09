part of 'new_bloc_bloc.dart';

abstract class NewBlocEvent extends Equatable {
  const NewBlocEvent();

  @override
  List<Object> get props => [];
}

class updateTitleEvent extends NewBlocEvent {
  final String title;
  updateTitleEvent(this.title);
}

class updateDescriptionEvent extends NewBlocEvent {
  final String description;
  updateDescriptionEvent(this.description);
}

class updateSelectedImgEvent extends NewBlocEvent {
  final String path;
  updateSelectedImgEvent(this.path);
}

class getIngredientCategoryEvent extends NewBlocEvent {
  final int categoryID;
  getIngredientCategoryEvent({required this.categoryID});
}

class addToSelectedIngredientEvent extends NewBlocEvent {
  final IngredientEntity ingredient;
  addToSelectedIngredientEvent({required this.ingredient});
}

class removeFromSelectedIngredientEvent extends NewBlocEvent {
  final IngredientEntity ingredient;
  removeFromSelectedIngredientEvent({required this.ingredient});
}

class searchIngredientEvent extends NewBlocEvent {
  final String searchText;
  searchIngredientEvent({required this.searchText});
}
