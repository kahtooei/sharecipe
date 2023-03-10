part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class HomeFirstLoadEvent extends HomeBlocEvent {}

class HomeMoreLoadEvent extends HomeBlocEvent {
  final int lastRecipeID;
  HomeMoreLoadEvent(this.lastRecipeID);
}

class GetRecipeDetailsEvent extends HomeBlocEvent {
  final int recipeID;
  GetRecipeDetailsEvent(this.recipeID);
}
