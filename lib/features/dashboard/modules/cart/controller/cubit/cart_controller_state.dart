part of 'cart_controller_cubit.dart';

@immutable
abstract class CartControllerState {}

final class CartControllerInitial extends CartControllerState {}

class CartLoading extends CartControllerState {}

class CartLoaded extends CartControllerState {
  final List<CartModel> carts;

  CartLoaded(this.carts);
}

class CartEmpty extends CartControllerState {}

class CartError extends CartControllerState {
  final String errorMessage;

  CartError(this.errorMessage);
}