import 'package:get_it/get_it.dart';
import 'package:sharecipe/feature/home/data/data_source/remote/home_remote_api.dart';
import 'package:sharecipe/feature/home/data/repository/home_data_repository_iml.dart';
import 'package:sharecipe/feature/home/domain/repository/home_data_repository.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_home_data_usecase.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_bloc.dart';

GetIt getIt = GetIt.instance;

setUp() {
  //call remote api
  getIt.registerSingleton<HomeRemoteAPI>(HomeRemoteAPI());

  //repository
  getIt.registerSingleton<HomeDataRepository>(
      HomeDataRepositoryImplementation(getIt()));

  //use case
  getIt.registerSingleton<GetHomeDataUseCase>(GetHomeDataUseCase(getIt()));

  //bloc
  getIt.registerSingleton<HomeBlocBloc>(HomeBlocBloc(getIt()));
}
