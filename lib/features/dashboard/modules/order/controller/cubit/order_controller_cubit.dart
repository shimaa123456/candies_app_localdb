import 'dart:developer';

import 'package:candies_db/features/dashboard/modules/logout/view/page/logout_page.dart';
import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_controller_state.dart';

class OrderControllerCubit extends Cubit<OrderControllerState> {
  OrderControllerCubit() : super(OrderControllerInitial());

   final DatabaseRepo _repo = DatabaseRepo();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addUser(BuildContext context) async {
     await _repo.initDB();
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final address = addressController.text;
      final phone = phoneController.text;
      print('adding');
      try {
        // Call insertUser from DatabaseRepo
        await _repo.insertUser(name, address, phone);

        print('User added successfully to database!');
        nameController.clear();
        addressController.clear();
        phoneController.clear();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LogOutPage(),
        ));
      } on Exception catch (error) {
        print('Failed to add user: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add user')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Data')),
      );
      log("Invalid Data");
    }
  }
}
