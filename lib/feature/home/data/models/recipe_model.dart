import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  int? id;
  String? title;
  String? description;
  String? cover;
  int? likeCount;

  RecipeModel(
      {this.id, this.title, this.description, this.cover, this.likeCount})
      : super(
            id: id,
            title: title,
            description: description,
            cover: cover,
            likeCount: likeCount);

  factory RecipeModel.fromJson(Map json) {
    return RecipeModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        cover: json['cover'],
        likeCount: json['likerCount']);
  }
}
