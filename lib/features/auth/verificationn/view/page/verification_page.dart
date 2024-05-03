
import 'package:candies_db/features/auth/verificationn/view/component/verficationBody.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffa6010f),
        title: Text(" Welcome $userName"),
      ),
      backgroundColor: const Color(0xfffec5c5),
      body: VerificationnBody(),
    );
  }
}
