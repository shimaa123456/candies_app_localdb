
import 'package:candies_db/features/auth/registration/controller/cubit/registeration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:candies_app/core/utlis/validation.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterationCubit (), // Provide RegisterationController
      child: BlocBuilder<RegisterationCubit, RegisterationState>(
          builder: (context, state) {
        // final RegisterationController controller = context.read<RegisterationController>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Have an account? "),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.orange,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationThickness: 1,
                ),
              ),
            ),
          ],
        );
     
   },
    ),
      );
      
      }
}
