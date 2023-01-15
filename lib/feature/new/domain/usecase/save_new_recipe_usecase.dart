import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/repository/save_new_recipe_repository.dart';

class SaveNewRecipeUseCase {
  final SaveNewRecipeRepository saveRepository;
  SaveNewRecipeUseCase(this.saveRepository);
  Future<RequestStatus<bool>> call(RecipeDetailsEntity recipe) {
    return saveRepository.saveRecipe(recipe);
  }
}
