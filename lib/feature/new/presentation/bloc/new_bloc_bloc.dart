import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/new/data/models/ingredient_model.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/usecase/get_ingredient_usecase.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';

class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  GetIngredientsUseCase getIngredients;
  NewBlocBloc(this.getIngredients)
      : super(const NewBlocState(
            selectedImgPath: '',
            title: '',
            description: '',
            ingredientsList: [],
            selectedIngredients: [])) {
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
          emit(state.copyWith(ingredients: []));
          RequestStatus<List<IngredientEntity>> requestStatus =
              await getIngredients(
                  (event as getIngredientCategoryEvent).categoryID);
          if (requestStatus is SuccessRequest) {
            emit(state.copyWith(ingredients: requestStatus.response));
          } else {
            emit(state.copyWith(ingredients: [
              IngredientModel(
                  id: -1,
                  name: 'no ingredient',
                  cover: '',
                  categoryID: -1,
                  description: '')
            ]));
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
      }
    });
  }
}
