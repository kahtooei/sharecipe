import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_home_data_usecase.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_recipe_details_usecase.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetRecipeDetailsUseCase getRecipeDetailsUseCase;
  HomeBlocBloc(this.getHomeDataUseCase, this.getRecipeDetailsUseCase)
      : super(HomeBlocState(
            status: HomeLoadingStatus(),
            recipeDetailsStatus: LoadingRecipeDetailsStatus())) {
    on<HomeBlocEvent>((event, emit) async {
      switch (event.runtimeType) {
        case HomeFirstLoadEvent:
          emit(state.copyWith(newStatus: HomeLoadingStatus()));
          RequestStatus<List<RecipeEntity>> requestStatus =
              await getHomeDataUseCase();
          if (requestStatus is SuccessRequest) {
            emit(state.copyWith(
                newStatus: HomeCompletedStatus(requestStatus.response!)));
          } else if (requestStatus is FailedRequest) {
            emit(state.copyWith(
                newStatus: HomeErrorStatus(requestStatus.error!)));
          }
          break;
        case GetRecipeDetailsEvent:
          emit(state.copyWith(
              recipe_details_status: LoadingRecipeDetailsStatus()));
          RequestStatus requestStatus = await getRecipeDetailsUseCase(
              (event as GetRecipeDetailsEvent).recipeID);
          if (requestStatus is SuccessRequest) {
            emit(state.copyWith(
                recipe_details_status:
                    CompleteRecipeDetailsStatus(requestStatus.response)));
          } else {
            emit(state.copyWith(
                recipe_details_status:
                    ErrorRecipeDetailsStatus(requestStatus.error!)));
          }
          break;
      }
    });
  }
}
