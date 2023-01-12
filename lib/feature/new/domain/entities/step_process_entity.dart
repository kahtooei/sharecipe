import 'package:equatable/equatable.dart';
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
}
