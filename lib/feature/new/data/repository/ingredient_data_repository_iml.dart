import 'dart:convert';

import 'package:sharecipe/feature/new/data/data_source/remote/ingredient_list_remote.dart';
import 'package:sharecipe/feature/new/data/models/ingredient_model.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/repository/ingredient_data_repository.dart';

class IngredientDataRepositoryImp extends IngredientDataRepository {
  final IngredientListAPI ingredientAPI;
  IngredientDataRepositoryImp(this.ingredientAPI);
  @override
  Future<RequestStatus<List<IngredientEntity>>> getIngredients(
      int categoryID) async {
    try {
      var res = await ingredientAPI.getIngredients(categoryID);
      var response = json.decode(res.body);
      if (response['status'] == 200) {
        List<IngredientEntity> ingredientList = [];
        List data = response['ingredientList'];
        for (Map ingredient in data) {
          ingredientList.add(IngredientModel.fromJson(ingredient));
        }
        return SuccessRequest(ingredientList);
      } else {
        return FailedRequest("error get ingredient data");
      }
    } catch (E) {
      return FailedRequest("failed connection ==> $E");
    }
  }
}
