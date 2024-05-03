
import 'package:candies_db/core/utlis/validation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgetBody extends StatelessWidget {
   ForgetBody({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

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
                "Reset Password",
                style: TextStyle(
                  fontSize: 44,
                  color: Color(0xffa6010f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              
              const Text(
            
              'Please Enter Your Email :',
                style: TextStyle(
                      fontSize: 20,
                       color: Color.fromARGB(255, 143, 140, 140),
              ),
             ),
             const SizedBox(
              height: 5,
            ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // email
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                         validator: RegistrationValidator().validateEmail,
                        decoration: decoration.copyWith(
                          labelText: 'Email',
                          hintText: 'xxxx@gmail.com',
                          prefixIcon: const Icon(Icons.mail),
                        ),
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
                        onPressed: () {
                          if (_validateInputs()) {
                            // Navigate to another page if inputs are valid
                            Navigator.pushNamed(context, '/reset');
                          } else {
                            // Show error message if inputs are not valid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid email or password')),
                            );
                          }
                        },
                            child: const Text(
                              "Reset",
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
    final email = emailController.text.trim();

    final validator = RegistrationValidator();
    return validator.validateResetEmail(email) == null;
  }
}


 
