part of 'new_bloc_bloc.dart';

abstract class NewBlocEvent extends Equatable {
  const NewBlocEvent();

  @override
  List<Object> get props => [];
}

class updateTitle extends NewBlocEvent {
  final String title;
  updateTitle(this.title);
}

class updateDescription extends NewBlocEvent {
  final String description;
  updateDescription(this.description);
}

class updateSelectedImg extends NewBlocEvent {
  final String path;
  updateSelectedImg(this.path);
}

class getIngredientCategory extends NewBlocEvent {
  final int categoryID;
  getIngredientCategory({required this.categoryID});
}
