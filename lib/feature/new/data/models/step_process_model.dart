import 'package:sharecipe/core/params/step_process_params.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';

class StepProcessModel extends StepProcessEntity {
  final int id;
  final IngredientEntity ingredient;
  final ProcessFunctionEntity function;
  final int duration;
  final int amount;
  const StepProcessModel(
      {required this.id,
      required this.ingredient,
      required this.function,
      required this.amount,
      required this.duration})
      : super(
            id: id,
            ingredient: ingredient,
            function: function,
            duration: duration,
            amount: amount);

  factory StepProcessModel.fromJson(Map json) {
    return StepProcessModel(
        id: json['id'],
        ingredient: json['ingredient'],
        function: json['function'],
        amount: json['amount'],
        duration: json['duration']);
  }

  factory StepProcessModel.createTemp(StepProcessParams params) {
    return StepProcessModel(
        id: -1,
        ingredient: params.ingredient,
        function: params.function,
        amount: params.amount,
        duration: params.duration);
  }
}
