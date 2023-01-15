import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

abstract class NewBlocStatus extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingIngredientListStatus extends NewBlocStatus {}

class CompleteIngredientListStatus extends NewBlocStatus {
  final List<IngredientEntity> ingredientList;
  CompleteIngredientListStatus(this.ingredientList);
}

class ErrorIngredientListStatus extends NewBlocStatus {
  final String error;
  ErrorIngredientListStatus(this.error);
}

class LoadingFunctionsStatus extends NewBlocStatus {}

class CompleteFunctionsStatus extends NewBlocStatus {
  final List<ProcessFunctionEntity> functionsList;
  CompleteFunctionsStatus(this.functionsList);
}

class ErrorFunctionsStatus extends NewBlocStatus {
  final String error;
  ErrorFunctionsStatus(this.error);
}

class InitSaveRecipeStatus extends NewBlocStatus {}

class LoadingSaveRecipeStatus extends NewBlocStatus {}

class ErrorSaveRecipeStatus extends NewBlocStatus {
  final String error;
  ErrorSaveRecipeStatus(this.error);
}

class CompleteSaveRecipeStatus extends NewBlocStatus {}
