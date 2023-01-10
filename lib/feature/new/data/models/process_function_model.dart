import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

class ProcessFunctionModel extends ProcessFunctionEntity {
  final int id;
  final String name;
  final String description;
  const ProcessFunctionModel(
      {required this.id, required this.name, required this.description})
      : super(id: id, name: name, description: description);

  factory ProcessFunctionModel.fromJson(Map json) {
    return ProcessFunctionModel(
        id: json['id'], name: json['name'], description: json['description']);
  }

  @override
  List<Object?> get props => [id, name, description];
}
