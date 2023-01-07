import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';

class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  NewBlocBloc()
      : super(const NewBlocState(
            selectedImgPath: '',
            title: '',
            description: '',
            ingredientsList: [],
            selectedIngredients: [])) {
    on<NewBlocEvent>((event, emit) {
      switch (event.runtimeType) {
        case updateTitle:
          emit(state.copyWith(newTitle: (event as updateTitle).title));
          break;
        case updateDescription:
          emit(state.copyWith(
              newDescription: (event as updateDescription).description));
          break;
        case updateSelectedImg:
          emit(state.copyWith(newImgPath: (event as updateSelectedImg).path));
          break;
      }
    });
  }
}
