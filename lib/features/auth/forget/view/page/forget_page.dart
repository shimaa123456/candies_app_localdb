

import 'package:candies_db/features/auth/forget/view/components/forgetBody.dart';
import 'package:flutter/material.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:  Scaffold(
        backgroundColor: const Color(0xfffec5c5),
        body:  ForgetBody (),
        )
      );
    
  }
}