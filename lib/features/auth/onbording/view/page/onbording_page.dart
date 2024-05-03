
import 'package:candies_db/features/auth/onbording/controller/onbording_controller_cubit.dart';
import 'package:candies_db/features/auth/onbording/view/components/onbording_body.dart';
import 'package:candies_db/features/auth/onbording/view/components/onbording_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnbordingControllerCubit>(
        create: (context) => OnbordingControllerCubit(),
        child: BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
          builder: (context, state) {
            OnbordingControllerCubit controller =
                context.read<OnbordingControllerCubit>();
            return Scaffold(
              body: OnbordingBody(
                controller: controller,
              ),
              backgroundColor: const Color(0xfffec5c5),
              bottomNavigationBar: OnbordingButtonWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
