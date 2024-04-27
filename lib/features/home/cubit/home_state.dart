part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeGetPersonsLoading extends HomeState {}

class HomeGetPersonsSuccess extends HomeState {}

class HomGetPersonsError extends HomeState {
  final String errorMsg;

  const HomGetPersonsError({required this.errorMsg});
}

class HomeAddPersonLoading extends HomeState {}

class HomeAddPersonSuccess extends HomeState {}

class HomAddPersonError extends HomeState {
  final String errorMsg;

  const HomAddPersonError({required this.errorMsg});
}
