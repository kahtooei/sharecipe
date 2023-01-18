import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/resources/request_status.dart';

abstract class RecipeDetailsRepository {
  Future<RequestStatus<RecipeDetailsEntity>> getRecipe(int recipeID);
}
