import 'package:equatable/equatable.dart';

abstract class IngredientEntity extends Equatable {
  int? id;
  String? name;
  String? description;
  String? cover;
  int? category;
  IngredientEntity(
      {this.id, this.name, this.description, this.cover, this.category});
}
