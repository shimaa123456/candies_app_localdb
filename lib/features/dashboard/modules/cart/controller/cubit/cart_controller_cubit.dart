import 'package:bloc/bloc.dart';
import 'package:candies_db/features/dashboard/modules/cart/model/cart_model.dart';
import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_controller_state.dart';



class CartControllerCubit extends Cubit<CartControllerState> {
    final DatabaseRepo _repo = DatabaseRepo();

  CartControllerCubit() : super(CartLoading()) {
    init();
  }


  List<CartModel> carts = [];
  Future<void> init() async {
    emit(CartLoading());
    try {
      await _repo.initDB();
       carts = await _repo.fetchCartItems();
      if (carts.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartLoaded(carts));
      }
    } catch (e) {
      emit(CartError("Failed to load users: $e"));
    }
  }

double calculateTotalPrice() {
  double totalPrice = 0;
  for (int i = 0; i < carts.length; i++) {
    // Check if totalPrice is not null before adding it
    if (carts[i].totalPrice != null) {
      totalPrice += carts[i].totalPrice!;
    }
  }
  return totalPrice;
}
}