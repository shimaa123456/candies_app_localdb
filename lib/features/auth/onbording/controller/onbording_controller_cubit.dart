// import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:candies_db/features/auth/onbording/model/onbording_model.dart';
import 'package:candies_db/features/auth/start/view/page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

part 'onbording_controller_state.dart';

class OnbordingControllerCubit extends Cubit<OnbordingControllerState> {
  OnbordingControllerCubit() : super(OnbordingControllerInitial());

  // List images = [
  //   'assets/images/client.png',
  //   'assets/images/client.png',
  //   'assets/images/client.png'
  // ];
  // List titles = [
  //   'First',
  //   'Second',
  //   'Third',
  // ];
  // List subtitles = [
  //   'First screen',
  //   'Second screen',
  //   'Third screen',
  // ];
  // List colors = [
  //    Colors.green,
  //    Colors.blue,
  //    Colors.red,
  // ];

  PageController pageController = PageController();

  // void onChangeToNext() {
  //   pageController.nextPage(
  //       duration:  Duration(seconds: 2), curve: Curves.bounceIn);
  // }
  void onChangeToNext(BuildContext context) {
    if (pageController.page == data.length - 1) {
      // Last page reached, navigate to registration page
      onCallSkip(context);
    } else {
      // Not the last page, proceed to the next page
      pageController.nextPage(
        duration: const Duration(microseconds: 250),
        curve: Curves.linear,
      );
    }
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onbording', true);

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const StartPage(),
      ),
    );
  }

  List data = [
    OnbordingModel(
        image: 'assets/images/first.jpeg',
        title: 'Welcome to the Cookie App! ',
        subtitle:
            'Get ready to discover a world of deliciousness! We will help you find the perfect cookie recipe, bake it to perfection, and share it with friends and family.',
        color: Colors.green),
    OnbordingModel(
        image: 'assets/images/second.jpeg',
        title: 'Find Your Perfect Cookie ',
        subtitle:
            ' We have a wide variety of recipes to choose from, from classic chocolate chip to fun and festive flavors. Browse by category, dietary restrictions, or search for something specific.',
        color: Colors.blue),
    OnbordingModel(
        image: 'assets/images/third.jpg',
        title: 'Bake with Confidence ',
        subtitle:
            'Our easy-to-follow instructions and helpful tips will ensure your cookies turn out perfect every time.',
        color: Colors.red),
  ];
}
