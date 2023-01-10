import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/feature/new/domain/repository/process_functions_repository.dart';

class GetProcessFunctionsUseCase {
  ProcessFunctionRepository processFunctionRepository;
  GetProcessFunctionsUseCase(this.processFunctionRepository);
  Future<RequestStatus<List<ProcessFunctionEntity>>> call() {
    return processFunctionRepository.getProcessFunctions();
  }
}
