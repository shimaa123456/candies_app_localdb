
import 'package:candies_db/features/auth/verfication/view/components/verficationBody.dart';
import 'package:flutter/material.dart';

class VerficationPage extends StatelessWidget {
  const VerficationPage({super.key,required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
                backgroundColor: Colors.red,
                title:  Text(" Welcome $userName"),
              ),
      backgroundColor: const Color(0xfffec5c5),
      body: VerificationBody(),
    ));
  }
}
