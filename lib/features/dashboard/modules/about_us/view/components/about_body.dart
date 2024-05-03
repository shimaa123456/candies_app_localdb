import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "assets/images/about1.jpeg",
      "assets/images/about2.jpeg",
      "assets/images/about3.jpeg",
      "assets/images/about4.jpeg",
      "assets/images/about5.jpeg",
    ];

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 35.0),
          const Padding(
            padding: EdgeInsets.only(left: 120.0),
            child: Text('Cookies',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa6010f))),
          ),
          const SizedBox(height: 25.0),
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: imageList
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    )
                .toList(),
          ),
          const SizedBox(height: 40.0),
          Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: const Text(
                  'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))),
            ),
          ),
          const SizedBox(height: 40.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xffa6010f)),
                  child: const Center(
                    child: Text(
                      'About Our Products',
                      style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )))
        ],
      ),
    );
  }
}
