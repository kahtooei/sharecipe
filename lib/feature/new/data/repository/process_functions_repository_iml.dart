import 'dart:convert';

import 'package:sharecipe/feature/new/data/data_source/remote/process_functions_list_remote.dart';
import 'package:sharecipe/feature/new/data/models/process_function_model.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/repository/process_functions_repository.dart';

class ProcessFunctionsRepositoryIml extends ProcessFunctionRepository {
  final ProcessFunctionsAPI processFunctionsAPI;
  ProcessFunctionsRepositoryIml(this.processFunctionsAPI);
  @override
  Future<RequestStatus<List<ProcessFunctionEntity>>>
      getProcessFunctions() async {
    try {
      var res = await processFunctionsAPI.getProcessFunctions();
      var response = json.decode(res.body);
      if (response['status'] == 200) {
        List<ProcessFunctionEntity> functionsList = [];
        List data = response['processFunctionsList'];
        for (Map functions in data) {
          functionsList.add(ProcessFunctionModel.fromJson(functions));
        }
        return SuccessRequest(functionsList);
      } else {
        return FailedRequest('error get processFunctions');
      }
    } catch (E) {
      return FailedRequest("Network Error ==> $E");
    }
  }
}
