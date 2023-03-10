import 'package:equatable/equatable.dart';
import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';

abstract class HomeBlocStatus extends Equatable {}

class HomeLoadingStatus extends HomeBlocStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingMoreStatus extends HomeBlocStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorStatus extends HomeBlocStatus {
  final String error;
  HomeErrorStatus(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class HomeErrorMoreStatus extends HomeBlocStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeCompletedStatus extends HomeBlocStatus {
  final List<RecipeEntity> recipes;
  HomeCompletedStatus(this.recipes);
  @override
  // TODO: implement props
  List<Object?> get props => [recipes];
}

class LoadingRecipeDetailsStatus extends HomeBlocStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorRecipeDetailsStatus extends HomeBlocStatus {
  final String error;
  ErrorRecipeDetailsStatus(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CompleteRecipeDetailsStatus extends HomeBlocStatus {
  final RecipeDetailsEntity recipe;
  CompleteRecipeDetailsStatus(this.recipe);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
