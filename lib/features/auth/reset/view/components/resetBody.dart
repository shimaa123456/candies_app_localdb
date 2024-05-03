
import 'package:candies_db/core/utlis/validation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetBody extends StatelessWidget {
  ResetBody({Key? key}) : super(key: key);

  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                height: 12,
              ),
              const Text(
                "New Password",
                style: TextStyle(
                  fontSize: 44,
                  color: Color(0xffa6010f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // new Password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController1,
                        keyboardType: TextInputType.visiblePassword,
                        validator: RegistrationValidator().validatePassword,
                        decoration: decoration.copyWith(
                          labelText: 'new password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                        obscuringCharacter: "*",
                      ),
                    ),

                    // confirm new  Password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController2,
                        keyboardType: TextInputType.visiblePassword,
                        validator: RegistrationValidator().validatePassword,
                        decoration: decoration.copyWith(
                          labelText: 'confirm new password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                        obscuringCharacter: "*",
                      ),
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
                            // onPressed: () {
                            //   if (_validateInputs() &&
                            //       (passwordController1.text ==
                            //           passwordController2.text)) {
                            //     // Navigate to another page if inputs are valid
                            //     Navigator.pushNamed(context, '/verfication');
                            //   } else {
                            //     // Show error message if inputs are not valid
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(
                            //           content:
                            //               Text('Incrorrect password input ')),
                            //     );
                            onPressed: () {
                              if (_validateInputs() &&
                                  (passwordController1.text ==
                                      passwordController2.text)) {
                                // Navigate to another page if inputs are valid
                                Navigator.pushNamed(context, '/login');
                              } else {
                                // Handle invalid inputs with more specific messages
                                if (!passwordController1.text.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Password cannot be empty'),
                                    ),
                                  );
                                } else if (passwordController1.text !=
                                    passwordController2.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Passwords don\'t match'),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              "Confirm",
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
    final password1 = passwordController1.text.trim();
    final password2 = passwordController2.text.trim();

    final validator = RegistrationValidator();
    return validator.validatePassword(password1) == null &&
        validator.validatePassword(password2) == null;
  }
}
