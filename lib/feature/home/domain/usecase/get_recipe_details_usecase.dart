import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/repository/recipe_details_repository.dart';

class GetRecipeDetailsUseCase {
  final RecipeDetailsRepository recipeData;
  GetRecipeDetailsUseCase(this.recipeData);
  Future<RequestStatus<RecipeDetailsEntity>> call(int recipeID) async {
    return recipeData.getRecipe(recipeID);
  }
}
