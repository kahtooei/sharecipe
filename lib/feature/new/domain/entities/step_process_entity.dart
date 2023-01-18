import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/data/models/ingredient_model.dart';
import 'package:sharecipe/feature/new/data/models/process_function_model.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

class StepProcessEntity extends Equatable {
  final int id;
  final IngredientEntity ingredient;
  final ProcessFunctionEntity function;
  final int duration;
  final int amount;

  const StepProcessEntity(
      {required this.id,
      required this.ingredient,
      required this.function,
      required this.amount,
      required this.duration});

  @override
  List<Object?> get props => [id, ingredient, function, amount, duration];

  String toJson() {
    return """ 
    {
      "id": $id,
      "ingredient": ${ingredient.id},
      "function": ${function.id},
      "amount": $amount,
      "duration": $duration,
    }
     """;
  }

  factory StepProcessEntity.fromJson(Map json) {
    IngredientEntity ingredient = IngredientModel.fromJson(json['ingredient']);
    ProcessFunctionEntity function =
        ProcessFunctionModel.fromJson(json['function']);
    return StepProcessEntity(
        id: json['id'],
        ingredient: ingredient,
        function: function,
        amount: json['amount'],
        duration: json['duration']);
  }
}
