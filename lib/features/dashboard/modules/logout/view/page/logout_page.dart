
import 'package:flutter/material.dart';
import '../components/logout_body.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffec5c5),
      body: LogOutBody(),
    ));
  }
}