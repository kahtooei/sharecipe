import 'dart:convert';

import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/data/data_source/remote/save_new_recipe_remote.dart';
import 'package:sharecipe/feature/new/domain/repository/save_new_recipe_repository.dart';

class SaveNewRecipeRepositoryImplementation extends SaveNewRecipeRepository {
  final SaveNewRecipeAPI saveAPI;
  SaveNewRecipeRepositoryImplementation(this.saveAPI);
  @override
  Future<RequestStatus<bool>> saveRecipe(RecipeDetailsEntity recipe) async {
    try {
      var res = await saveAPI.saveRecipe(recipe);
      var response = json.decode(res.body);
      if (response['status'] == 200) {
        return SuccessRequest(true);
      } else {
        return FailedRequest("error");
      }
    } catch (E) {
      return FailedRequest("error : $E");
    }
  }
}
