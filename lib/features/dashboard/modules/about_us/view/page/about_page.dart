
import 'package:candies_db/features/dashboard/modules/about_us/view/components/about_body.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffec5c5),
      body: AboutBody(),
    ));
  }
}