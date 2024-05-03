import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton2(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home' ,);
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Invalid email or password')),
        );
      log("invalid input");
    }
  }
}
