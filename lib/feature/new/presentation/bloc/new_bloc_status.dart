import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

abstract class IngredientBlocStatus extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingIngredientListStatus extends IngredientBlocStatus {}

class CompleteIngredientListStatus extends IngredientBlocStatus {
  final List<IngredientEntity> ingredientList;
  CompleteIngredientListStatus(this.ingredientList);
}

class ErrorIngredientListStatus extends IngredientBlocStatus {
  final String error;
  ErrorIngredientListStatus(this.error);
}
