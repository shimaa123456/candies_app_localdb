
import 'package:candies_db/core/utlis/validation.dart';
import 'package:candies_db/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginBody extends StatelessWidget {
  LoginBody({super.key, required this.controller});
  final LoginCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();
          return Form(
            key: controller.formKey,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
                top: 50,
                bottom: 20,
              ),
              child: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 70.0,
                        backgroundColor: const Color(0xfffec5c5),
                        backgroundImage: AssetImage('assets/logo2.jpg'),
                      ),
                      // Container(
                      //   height: 120,
                      //   width: 120,
                      //   child: Image.asset("assets/customer.png"),
                      // ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Your favourite",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const Text(
                        "Cookies",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffa6010f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // email
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator:
                                    RegistrationValidator().validateLoginEmail,
                                decoration: decoration.copyWith(
                                  labelText: 'Email',
                                  hintText: 'xxxx@gmail.com',
                                  prefixIcon: const Icon(Icons.mail),
                                ),
                              ),
                            ),

                            // Password
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: RegistrationValidator()
                                    .validateLoginPassword,
                                decoration: decoration.copyWith(
                                  labelText: 'password',
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                obscureText: true,
                                obscuringCharacter: "*",
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/forget');
                                  },
                                  child: const Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 82, 0, 7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            // button
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Container(
                                height: 50,
                                width: 210,
                                decoration: BoxDecoration(
                                    color: const Color(0xffa6010f),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      controller
                                          .onPressedConfirmButton2(context);
                                      // if (_validateInputs()) {
                                      //   // Navigate to another page if inputs are valid
                                      //   Navigator.pushNamed(context, '/home');
                                      // } else {
                                      //   // Show error message if inputs are not valid
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     const SnackBar(
                                      //         content: Text(
                                      //             'Invalid email or password')),
                                      //   );
                                      // }
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account?"),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Color(0xffa6010f),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
      //   label: const Text("last Name"),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ));

  // Function to validate email and password
  bool _validateInputs() {
    final email = controller.emailController.text.trim();
    final password = controller.passwordController.text.trim();

    final validator = RegistrationValidator();
    return validator.validateLoginEmail(email) == null &&
        validator.validateLoginPassword(password) == null;
  }
}
