import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

class StepProcessParams {
  final IngredientEntity ingredient;
  final ProcessFunctionEntity function;
  final int duration;
  final int amount;
  StepProcessParams(
      {required this.ingredient,
      required this.function,
      required this.duration,
      required this.amount});
}
