import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

class IngredientModel extends IngredientEntity {
  int? id;
  String? name;
  String? description;
  String? cover;
  int? categoryID;
  IngredientModel(
      {this.id, this.name, this.description, this.cover, this.categoryID})
      : super(
            id: id,
            name: name,
            description: description,
            cover: cover,
            category: categoryID);
  @override
  // TODO: implement props
  List<Object?> get props => [id];

  factory IngredientModel.fromJson(Map json) {
    return IngredientModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        cover: json['cover'],
        categoryID: json['categoryID']);
  }
}
