part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded(this.users);
}

class UserEmpty extends UserState {}

class UserError extends UserState {
  final String errorMessage;

  UserError(this.errorMessage);
}