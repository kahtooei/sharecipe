import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  int? id;
  String? title;
  String? description;
  String? cover;
  int? likeCount;

  RecipeEntity(
      {this.id, this.title, this.description, this.cover, this.likeCount});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
