import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/feature/home/domain/repository/home_data_repository.dart';

class GetHomeDataUseCase {
  final HomeDataRepository homeData;
  GetHomeDataUseCase(this.homeData);
  Future<RequestStatus<List<RecipeEntity>>> call({int lastID = 0}) async {
    // var res = await homeData.getRecipes(lastID);
    // if (res is SuccessRequest) {
    //   List<RecipeEntity> lst = res.response!;
    //   //do some work with this list
    // }
    return homeData.getRecipes(lastID);
  }
}
