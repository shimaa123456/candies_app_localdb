import 'package:bloc/bloc.dart';
import 'package:candies_db/features/dashboard/modules/home/model/home_model.dart';
import 'package:flutter/material.dart';
part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());


  PageController pageController = PageController();

void onPressedCartButton(BuildContext context, HomeControllerCubit controller, int index) {
  Navigator.pushNamed(
    context,
    '/detail',
    arguments: {
      'image': controller.data[index].image,
      'name': controller.data[index].name,
      'price': controller.data[index].price,
    },
  );
}

  List data = [
     HomeModel(
        image: 'assets/images/p1.jpeg',
        name: 'cookie classic! ',
        price: '10.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
        HomeModel(
        image: 'assets/images/p2.jpeg',
        name: 'Anzac Biscuits! ',
        price: '15.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
         HomeModel(
        image: 'assets/images/p3.jpeg',
        name: 'Oatmeal Cookies! ',
        price: '18.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
         HomeModel(
        image: 'assets/images/p4.jpeg',
        name: 'Snickerdoodles! ',
        price: '7.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
         HomeModel(
        image: 'assets/images/p5.jpg',
        name: 'Sugar Cookies! ',
        price: '20.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
         HomeModel(
        image: 'assets/images/p6.jpg',
        name: 'Gingerbread! ',
        price: '30.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
     HomeModel(
        image: 'assets/images/p7.jpg',
        name: 'Macarons! ',
        price: '25.0',
        color: const Color.fromARGB(255, 186, 41, 89)),
     HomeModel(
        image: 'assets/images/p8.jpg',
        name: 'Biscotti! ',
        price: '40.0',
        color: const Color.fromARGB(255, 186, 41, 89)),

  ];
}

