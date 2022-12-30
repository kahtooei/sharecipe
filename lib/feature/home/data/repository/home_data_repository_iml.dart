import 'package:sharecipe/feature/home/data/models/recipe_model.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/repository/home_data_repository.dart';
import '../data_source/remote/home_remote_api.dart';

class HomeDataRepositoryImplementation extends HomeDataRepository {
  final HomeRemoteAPI homeAPI;
  HomeDataRepositoryImplementation(this.homeAPI);
  @override
  Future<RequestStatus<List<RecipeEntity>>> getRecipes() async {
    var response = await homeAPI.getHomeRecipes();
    if (response['status'] == 200) {
      List<RecipeEntity> recipeList = [];
      List data = response['recipeList'];
      for (Map recipe in data) {
        recipeList.add(RecipeModel.fromJson(recipe));
      }
      return SuccessRequest(recipeList);
    } else {
      return FailedRequest("error get home data");
    }
  }
}