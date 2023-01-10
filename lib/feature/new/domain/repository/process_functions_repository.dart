import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

abstract class ProcessFunctionRepository {
  Future<RequestStatus<List<ProcessFunctionEntity>>> getProcessFunctions();
}
