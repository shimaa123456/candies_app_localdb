
import 'package:candies_db/core/utlis/context_extension.dart';
import 'package:candies_db/features/auth/onbording/controller/onbording_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OnbordingBody extends StatelessWidget {
  OnbordingBody({super.key, required this.controller});
  OnbordingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height / 20,
        ),
       Text(
        "Welcome in our app",
         style: TextStyle(
             color:  const Color(0xffa6010f),
             fontSize: 28, 
             fontWeight: FontWeight.bold,
             shadows: [
               Shadow(
                 color: Colors.black.withOpacity(0.2), 
                 offset: const Offset(2, 2), 
                 blurRadius: 3, 
               ),
             ],
          ),
         ),

        Expanded(
          child: BlocProvider<OnbordingControllerCubit>.value(
            value: controller,
            child:
                BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
              builder: (context, state) {
                OnbordingControllerCubit controller =
                    context.read<OnbordingControllerCubit>();

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    right: 40,
                    left: 40,
                    top: 30,
                    bottom: 20,
                  ),
                  child: PageView(
                    controller: controller.pageController,
                    children: List.generate(
                      controller.data.length,
                      (index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage(controller.data[index].image),
                            ),
                            //   Container(
                            //     width: 200,
                            //     height: 200,
                            //     child: Image.asset(
                            //      controller.data[index].image,
                            //      fit: BoxFit.cover,
                            //      ),
                            //  ),
                            const SizedBox(height: 30),
                            Text(
                              controller.data[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: controller.data[index].color,
                              ),
                            ),
                            SizedBox(
                              height: context.height / 58,
                            ),
                            Text(
                              controller.data[index].subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}