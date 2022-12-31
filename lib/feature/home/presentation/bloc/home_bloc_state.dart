part of 'home_bloc_bloc.dart';

class HomeBlocState extends Equatable {
  final HomeBlocStatus status;
  HomeBlocState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];

  HomeBlocState copyWith({HomeBlocStatus? newStatus}) {
    return HomeBlocState(status: newStatus ?? status);
  }
}
