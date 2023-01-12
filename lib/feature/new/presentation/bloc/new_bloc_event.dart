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

class getFunctionsEvent extends NewBlocEvent {}

class addNewStepEvent extends NewBlocEvent {
  final RecipeStepEntity step;
  addNewStepEvent(this.step);
}

class removeStepEvent extends NewBlocEvent {
  final RecipeStepEntity step;
  removeStepEvent(this.step);
}

class editStepEvent extends NewBlocEvent {
  final RecipeStepEntity step;
  editStepEvent(this.step);
}

class reorderStepEvent extends NewBlocEvent {
  final RecipeStepEntity step;
  final bool isUp;
  reorderStepEvent(this.step, this.isUp);
}

class addCurrentStepProcessEvent extends NewBlocEvent {
  final StepProcessEntity process;
  addCurrentStepProcessEvent(this.process);
}

class emptyCurrentProcessList extends NewBlocEvent {}
