
import 'package:candies_db/features/dashboard/modules/home/controller/cubit/home_controller_cubit.dart';
import 'package:candies_db/features/dashboard/modules/home/view/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeControllerCubit>(
        create: (context) => HomeControllerCubit(),
        child: BlocBuilder<HomeControllerCubit, HomeControllerState>(
          builder: (context, state) {
            HomeControllerCubit controller =
                context.read<HomeControllerCubit>();
               
          return SafeArea(
            child: Scaffold(
              //backgroundColor: Color(0xfffec5c5),
              body: HomeBody(
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
