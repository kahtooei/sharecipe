import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/repository/ingredient_data_repository.dart';

class GetIngredientsUseCase {
  IngredientDataRepository ingredientData;
  GetIngredientsUseCase(this.ingredientData);
  Future<RequestStatus<List<IngredientEntity>>> call(int categoryID) async {
    return ingredientData.getIngredients(categoryID);
  }
}
