import 'package:get_it/get_it.dart';
import 'package:sharecipe/feature/home/data/data_source/remote/home_remote_api.dart';
import 'package:sharecipe/feature/home/data/repository/home_data_repository_iml.dart';
import 'package:sharecipe/feature/home/data/repository/recipe_details_repository_iml.dart';
import 'package:sharecipe/feature/home/domain/repository/home_data_repository.dart';
import 'package:sharecipe/feature/home/domain/repository/recipe_details_repository.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_home_data_usecase.dart';
import 'package:sharecipe/feature/home/domain/usecase/get_recipe_details_usecase.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:sharecipe/feature/new/data/data_source/remote/ingredient_list_remote.dart';
import 'package:sharecipe/feature/new/data/data_source/remote/process_functions_list_remote.dart';
import 'package:sharecipe/feature/new/data/data_source/remote/save_new_recipe_remote.dart';
import 'package:sharecipe/feature/new/data/repository/ingredient_data_repository_iml.dart';
import 'package:sharecipe/feature/new/data/repository/process_functions_repository_iml.dart';
import 'package:sharecipe/feature/new/data/repository/save_new_recipe_repository_iml.dart';
import 'package:sharecipe/feature/new/domain/repository/ingredient_data_repository.dart';
import 'package:sharecipe/feature/new/domain/repository/process_functions_repository.dart';
import 'package:sharecipe/feature/new/domain/repository/save_new_recipe_repository.dart';
import 'package:sharecipe/feature/new/domain/usecase/get_ingredient_usecase.dart';
import 'package:sharecipe/feature/new/domain/usecase/get_process_functions_usecase.dart';
import 'package:sharecipe/feature/new/domain/usecase/save_new_recipe_usecase.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

import 'feature/home/data/data_source/remote/recipe_details_remote_api.dart';

GetIt getIt = GetIt.instance;

setUp() {
  //call remote api
  getIt.registerSingleton<HomeRemoteAPI>(HomeRemoteAPI());
  getIt.registerSingleton<IngredientListAPI>(IngredientListAPI());
  getIt.registerSingleton<ProcessFunctionsAPI>(ProcessFunctionsAPI());
  getIt.registerSingleton<SaveNewRecipeAPI>(SaveNewRecipeAPI());
  getIt.registerSingleton<RecipeDetailsRemoteAPI>(RecipeDetailsRemoteAPI());

  //repository
  getIt.registerSingleton<HomeDataRepository>(
      HomeDataRepositoryImplementation(getIt()));
  getIt.registerSingleton<IngredientDataRepository>(
      IngredientDataRepositoryImp(getIt()));
  getIt.registerSingleton<ProcessFunctionRepository>(
      ProcessFunctionsRepositoryIml(getIt()));
  getIt.registerSingleton<SaveNewRecipeRepository>(
      SaveNewRecipeRepositoryImplementation(getIt()));
  getIt.registerSingleton<RecipeDetailsRepository>(
      RecipeDetailsRepositoryImplementation(getIt()));

  //use case
  getIt.registerSingleton<GetHomeDataUseCase>(GetHomeDataUseCase(getIt()));
  getIt
      .registerSingleton<GetIngredientsUseCase>(GetIngredientsUseCase(getIt()));
  getIt.registerSingleton<GetProcessFunctionsUseCase>(
      GetProcessFunctionsUseCase(getIt()));
  getIt.registerSingleton<SaveNewRecipeUseCase>(SaveNewRecipeUseCase(getIt()));
  getIt.registerSingleton<GetRecipeDetailsUseCase>(
      GetRecipeDetailsUseCase(getIt()));

  //bloc
  getIt.registerSingleton<HomeBlocBloc>(HomeBlocBloc(getIt(), getIt()));
  getIt.registerSingleton<NewBlocBloc>(NewBlocBloc(getIt(), getIt(), getIt()));
}
