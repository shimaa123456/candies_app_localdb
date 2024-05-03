import 'package:bloc/bloc.dart';
import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'detail_controller_state.dart';

class DetailControllerCubit extends Cubit<DetailControllerState> {
  DetailControllerCubit() : super(DetailControllerInitial());

 final DatabaseRepo _repo = DatabaseRepo();

  void decreaseQuantity(String price, double totalPrice, int itemCount) {
    if (itemCount > 1) {
      totalPrice -= double.parse(price);
      itemCount--;
      emit(ItemChanged(totalPrice: totalPrice, itemCount: itemCount));
    }
  }

  void increaseQuantity(String price, double totalPrice, int itemCount) {
    totalPrice += double.parse(price);
    itemCount++;
    emit(ItemChanged(totalPrice: totalPrice, itemCount: itemCount));
  }

  int pressCount = 0;
  Future<void> onPressedCartButton(BuildContext context, String name,
      String image, double totalPrice, int itemCount) async {
    pressCount++;
  //await (await  DatabaseRepo.instance).insert(image: name, name: image, totalPrice: totalPrice, itemCount: itemCount);
      try {
        await _repo.initDB();
        await _repo.insertCartItem(name, image, totalPrice,itemCount);
        print('Cartadded successfully to database!');
         Navigator.pushNamed(
      context,
      '/cart',
    );
      } on Exception catch (error) {
        print('Failed to add cart: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add cart')),
        );
      }
    }
   
  }


