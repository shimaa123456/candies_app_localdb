
import 'package:candies_db/core/utlis/context_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartBody extends StatelessWidget {
  const StartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xfffb4c93),
                  Color(0xff9d030f),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
                ),
               
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 300,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/start.png',
                      width: context.width*.50,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/');
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
            ],
          ),
        ),
      
    
    );
  }
}
