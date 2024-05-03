import 'dart:ui';

import 'package:flutter/material.dart';

class OnbordingModel {
  late String image, title, subtitle;
  late Color color;

  OnbordingModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.color = Colors.black});
}
