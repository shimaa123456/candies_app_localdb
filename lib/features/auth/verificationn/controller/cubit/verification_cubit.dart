import 'package:bloc/bloc.dart';
import 'package:candies_db/features/auth/login/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:developer';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  TextEditingController pinCodeController = TextEditingController();
  final String validCode = '77777';
  void onTapConfirm(BuildContext context) {
    if (pinCodeController.text == validCode) {
      print("valid");
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const LoginPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid input')),
      );
      log("invalid input");
    }
  }
}
