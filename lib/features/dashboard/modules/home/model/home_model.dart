import 'dart:ui';

import 'package:flutter/material.dart';

class HomeModel {
  late String image, name, price;
  late Color color;

  HomeModel(
      {required this.image,
      required this.name,
      required this.price,
      this.color = Colors.brown});
}