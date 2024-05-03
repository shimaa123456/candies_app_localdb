
import 'package:candies_db/core/utlis/validation.dart';
import 'package:candies_db/features/auth/registration/controller/cubit/registeration_cubit.dart';
import 'package:candies_db/features/auth/registration/view/components/text_phone_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});
  final RegisterationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegisterationCubit, RegisterationState>(
          builder: (context, state) {
            
            RegisterationCubit controller = context.read<RegisterationCubit>();

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
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "Create new account",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "Sign Up",
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
                            // user name

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.userNameController,
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                                  FilteringTextInputFormatter.deny(RegExp(r'[-]')),
                                  ],
                                validator:
                                    RegistrationValidator().validateUserName,
                                decoration: decoration.copyWith(
                                  labelText: 'User Name',
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                //  validator: (String? input){
                                //  MyValidation().nameValidate(input??'');
                                // }
                              ),
                            ),

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
                                    RegistrationValidator().validateEmail,
                                decoration: decoration.copyWith(
                                  labelText: 'Email',
                                  hintText: 'xxxx@gmail.com',
                                  prefixIcon: const Icon(Icons.mail),
                                ),
                              ),
                            ),

                            // Phone
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.phoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [MyPhoneTextFieldFormater()],
                                validator:
                                    RegistrationValidator().validatePhone,
                                decoration: decoration.copyWith(
                                  labelText: 'Phone',
                                  prefixIcon: const Icon(Icons.phone),
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
                                validator:
                                    RegistrationValidator().validatePassword,
                                decoration: decoration.copyWith(
                                  labelText: 'password',
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                obscureText: true,
                                obscuringCharacter: "*",
                              ),
                            ),

                    //button
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
                              
                                controller.onPressedConfirmButton(context);
                              // if (_validateInputs()) {
                              //   // Navigate to another page if inputs are valid
                              //   Navigator.pushNamed(context, '/verfication');
                              // } else {
                              //   // Show error message if inputs are not valid
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text('Invalid Data Input')),
                              //   );
                              // }
                            },
                            child: const Text(
                              "Sign Up",
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
            ],
          ),
        ),
      ),
    ),
          );
          })
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

  // bool _validateInputs() {
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();
  //   final username = userNameController.text.trim();
  //   final phone = phoneController.text.trim();

  //   final validator = RegistrationValidator();
  //   return validator.validateEmail(email) == null &&
  //       validator.validatePassword(password) == null &&
  //       validator.validateUserName(username) == null &&
  //       validator.validatePhone(phone) == null;
  // }
  }




