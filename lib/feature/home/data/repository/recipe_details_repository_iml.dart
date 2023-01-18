import 'dart:convert';

import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/feature/home/data/data_source/remote/recipe_details_remote_api.dart';
import 'package:sharecipe/feature/home/data/models/recipe_details_model.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/repository/recipe_details_repository.dart';

class RecipeDetailsRepositoryImplementation extends RecipeDetailsRepository {
  final RecipeDetailsRemoteAPI recipeDetailsAPI;
  RecipeDetailsRepositoryImplementation(this.recipeDetailsAPI);

  @override
  Future<RequestStatus<RecipeDetailsEntity>> getRecipe(int recipeID) async {
    try {
      var res = await recipeDetailsAPI.getRecipeDetails(recipeID);
      var response = json.decode(res.body);
      if (response['status'] == 200) {
        Map data = response['recipeDetails'];
        RecipeDetailsEntity recipeDetails = RecipeDetailsModel.fromJson(data);
        return SuccessRequest(recipeDetails);
      } else {
        return FailedRequest("error get home data");
      }
    } catch (E) {
      print("Error ==> $E");
      return FailedRequest("failed connection ==> $E");
    }
  }
}
