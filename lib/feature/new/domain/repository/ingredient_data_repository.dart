import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

abstract class IngredientDataRepository {
  Future<RequestStatus<List<IngredientEntity>>> getIngredients(int categoryID);
}
