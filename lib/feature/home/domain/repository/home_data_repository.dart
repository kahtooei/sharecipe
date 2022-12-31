import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/data/data_source/remote/home_remote_api.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';

abstract class HomeDataRepository {
  Future<RequestStatus<List<RecipeEntity>>> getRecipes(int lastID);
}
