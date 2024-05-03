
import 'package:candies_db/features/auth/reset/view/components/resetBody.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfffec5c5),
      body: ResetBody(),
    ));
  }
}
