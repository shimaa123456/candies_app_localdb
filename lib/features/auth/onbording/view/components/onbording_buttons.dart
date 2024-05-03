
import 'package:candies_db/features/auth/onbording/controller/onbording_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OnbordingButtonWidget extends StatelessWidget {
  OnbordingButtonWidget({super.key, required this.controller});
  OnbordingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnbordingControllerCubit>.value(
      value: controller,
      child: BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
        builder: (context, state) {
          OnbordingControllerCubit controller =
              context.read<OnbordingControllerCubit>();
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(
                    onPressed: () {
                      controller.onCallSkip(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(90, 40)),
                      foregroundColor:
                          MaterialStateProperty.all(const Color(0xffa6010f)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blueGrey;
                        }
                        return const Color(0xffa6010f);
                      }),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(
                    onPressed: () {
                      controller.onChangeToNext(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(90, 40)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color(0xffa6010f)), // Always blue
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blueGrey; // Light blue when pressed
                        }
                        return const Color(0xffa6010f); // Blue-grey otherwise
                      }),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
