import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerificationBody extends StatelessWidget {
  VerificationBody({Key? key}) : super(key: key);

  final TextEditingController textField1Controller = TextEditingController();
  final TextEditingController textField2Controller = TextEditingController();
  final TextEditingController textField3Controller = TextEditingController();
  final TextEditingController textField4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Verification Page",
                style: TextStyle(
                  fontSize: 44,
                  color: Color(0xffa6010f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 42),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: textField1Controller,
                            keyboardType: TextInputType.name,
                            maxLength: 1,
                            decoration: _decoration,
                          ),
                        ),
                         const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: textField2Controller,
                            keyboardType: TextInputType.name,
                            maxLength: 1,
                            decoration: _decoration,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: textField3Controller,
                            keyboardType: TextInputType.name,
                            maxLength: 1,
                            decoration: _decoration,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: textField4Controller,
                            keyboardType: TextInputType.name,
                            maxLength: 1,
                            decoration: _decoration,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 210,
                      child: ElevatedButton(
                        onPressed: () {
                          if (textField1Controller.text.trim().isEmpty ||
                              textField2Controller.text.trim().isEmpty ||
                              textField3Controller.text.trim().isEmpty ||
                              textField4Controller.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please Enter Characters')),
                            );
                          } else {
                            Navigator.pushNamed(context, '/login');
                          }
                        },
                         style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffa6010f)), // Set background color here
                           ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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

  final InputDecoration _decoration = InputDecoration(
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
    ),
  );
}



 
