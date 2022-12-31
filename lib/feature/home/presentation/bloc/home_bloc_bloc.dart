import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecipe/core/resources/request_status.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_home_data_usecase.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeBlocBloc(this.getHomeDataUseCase)
      : super(HomeBlocState(status: HomeLoadingStatus())) {
    on<HomeFirstLoadEvent>((event, emit) async {
      emit(state.copyWith(newStatus: HomeLoadingStatus()));
      RequestStatus requestStatus = await getHomeDataUseCase();
    });
  }
}
