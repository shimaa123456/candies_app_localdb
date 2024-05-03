import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogOutBody extends StatelessWidget {
  const LogOutBody({super.key});

  final String imagePath = 'assets/images/splash.png'; // Extracted image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffec5c5),
      appBar: AppBar(
        backgroundColor: const Color(0xffa6010f),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfffdfefe)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(' Log Out',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xfffefefe))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 45),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Thanks for your order",
                  style: TextStyle(
                    color: Color.fromARGB(255, 223, 51, 88),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 17),

          // categories -> horizontal listview
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "The candies are on its way!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 197, 79, 89),
                    fontSize: 27,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Padding(
            padding:
                const EdgeInsets.all(20.0), // Adjust padding values as needed
            child: Image.asset(
              imagePath,
              width: 400, // Optional: Set width and height for the image
              height: 250,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Container(
              height: 50,
              width: 210,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: const Color(0xffa6010f),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
