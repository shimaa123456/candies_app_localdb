
import 'package:candies_db/features/auth/start/view/components/startBody.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffec5c5),
      body: StartBody(),
    ));
  }
}
