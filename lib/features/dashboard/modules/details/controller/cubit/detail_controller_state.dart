part of 'detail_controller_cubit.dart';

@immutable
sealed class DetailControllerState {}

final class DetailControllerInitial extends DetailControllerState {}

class ItemChanged extends DetailControllerState {
  final double totalPrice;
  final int itemCount;

  ItemChanged({required this.totalPrice, required this.itemCount});
}


