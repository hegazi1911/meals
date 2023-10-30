part of 'meals_cubit.dart';

@immutable
sealed class MealsState {}

final class MealsInitial extends MealsState {}

final class MealsLoading extends  MealsState{}

final class MealsSucces extends MealsState {}

final class MealsFailure extends MealsState {
  final String errMassege;

  MealsFailure(this.errMassege);
}