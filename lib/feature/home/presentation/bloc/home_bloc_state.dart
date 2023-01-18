part of 'home_bloc_bloc.dart';

class HomeBlocState extends Equatable {
  final HomeBlocStatus status;
  final HomeBlocStatus recipeDetailsStatus;
  const HomeBlocState(
      {required this.status, required this.recipeDetailsStatus});
  @override
  // TODO: implement props
  List<Object?> get props => [status, recipeDetailsStatus];

  HomeBlocState copyWith(
      {HomeBlocStatus? newStatus, HomeBlocStatus? recipe_details_status}) {
    return HomeBlocState(
        status: newStatus ?? status,
        recipeDetailsStatus: recipe_details_status ?? recipeDetailsStatus);
  }
}
