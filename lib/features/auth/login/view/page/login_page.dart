
import 'package:candies_db/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:candies_db/features/auth/login/view/components/loginBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final LoginCubit controller = context.read<LoginCubit>();
            return Scaffold(
              backgroundColor: const Color(0xfffec5c5),
              body: LoginBody(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
