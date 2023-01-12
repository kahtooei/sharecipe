import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';
import 'package:sharecipe/feature/new/domain/usecase/get_ingredient_usecase.dart';
import 'package:sharecipe/feature/new/domain/usecase/get_process_functions_usecase.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_status.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';

class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  GetIngredientsUseCase getIngredients;
  GetProcessFunctionsUseCase getProcessFunctions;
  NewBlocBloc(this.getIngredients, this.getProcessFunctions)
      : super(NewBlocState(
            selectedImgPath: '',
            title: '',
            description: '',
            searchText: "",
            selectedIngredients: const [],
            ingredientStatus: LoadingIngredientListStatus(),
            functionsStatus: LoadingFunctionsStatus(),
            steps: const [],
            currentStepProcessList: const [])) {
    on<NewBlocEvent>((event, emit) async {
      switch (event.runtimeType) {
        case updateTitleEvent:
          emit(state.copyWith(newTitle: (event as updateTitleEvent).title));
          break;
        case updateDescriptionEvent:
          emit(state.copyWith(
              newDescription: (event as updateDescriptionEvent).description));
          break;
        case updateSelectedImgEvent:
          emit(state.copyWith(
              newImgPath: (event as updateSelectedImgEvent).path));
          break;
        case getIngredientCategoryEvent:
          emit(state.copyWith(
              ingredient_status: LoadingIngredientListStatus(),
              search_text: ''));
          RequestStatus<List<IngredientEntity>> requestStatus =
              await getIngredients(
                  (event as getIngredientCategoryEvent).categoryID);
          if (requestStatus is SuccessRequest) {
            emit(state.copyWith(
                ingredient_status:
                    CompleteIngredientListStatus(requestStatus.response!)));
          } else {
            emit(state.copyWith(
                ingredient_status:
                    ErrorIngredientListStatus(requestStatus.error!)));
          }
          break;
        case addToSelectedIngredientEvent:
          List<IngredientEntity> selected = state.selectedIngredients +
              [(event as addToSelectedIngredientEvent).ingredient];
          emit(state.copyWith(selected_ingredients: selected));
          break;
        case removeFromSelectedIngredientEvent:
          List<IngredientEntity> selected = state.selectedIngredients + [];
          selected
              .remove((event as removeFromSelectedIngredientEvent).ingredient);
          emit(state.copyWith(selected_ingredients: selected));
          break;
        case searchIngredientEvent:
          emit(state.copyWith(
              search_text: (event as searchIngredientEvent).searchText));
          break;
        case getFunctionsEvent:
          emit(state.copyWith(function_status: LoadingFunctionsStatus()));
          RequestStatus<List<ProcessFunctionEntity>> requestStatus =
              await getProcessFunctions();
          if (requestStatus is SuccessRequest) {
            emit(state.copyWith(
                function_status:
                    CompleteFunctionsStatus(requestStatus.response!)));
          } else {
            emit(state.copyWith(
                function_status: ErrorFunctionsStatus(requestStatus.error!)));
          }
          break;
        case addNewStepEvent:
          //add logics
          break;
        case removeStepEvent:
          //add logics
          break;
        case editStepEvent:
          //add logics
          break;
        case reorderStepEvent:
          //add logics
          break;
        case addCurrentStepProcessEvent:
          List<StepProcessEntity> currentProcess =
              state.currentStepProcessList +
                  [(event as addCurrentStepProcessEvent).process];
          emit(state.copyWith(current_step_process_list: currentProcess));
          break;
        case emptyCurrentProcessList:
          emit(state.copyWith(current_step_process_list: []));
          break;
      }
    });
  }
}
