
import 'package:candies_db/core/utlis/context_extension.dart';
import 'package:candies_db/features/auth/verificationn/controller/cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationnBody extends StatelessWidget {
  VerificationnBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final VerificationCubit cubit = context.read<VerificationCubit>();
          return Scaffold(
            backgroundColor: const Color(0xfffec5c5),
            //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            //child: GestureDetector(
            //onTap: () => FocusScope.of(context).unfocus(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Enter your code",
                  style: TextStyle(
                    fontSize: 44,
                    color: Color(0xffa6010f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(context.width.toString()),
                const SizedBox(height: 42),
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  obscureText: true,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    inactiveFillColor: const Color(0xfffec5c5),
                    selectedColor: Colors.grey,
                    activeFillColor: const Color(0xfffec5c5),
                    errorBorderColor: const Color(0xfffec5c5),
                    fieldOuterPadding:
                        EdgeInsets.only(right: context.width / 30),
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: context.width / 6,
                    fieldWidth: context.width / 6,
                    selectedFillColor: const Color(0xfffec5c5),
                  ),
                  cursorColor: Colors.blue,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: cubit.pinCodeController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {},
                ),
                IconButton(
                  onPressed: () => cubit.onTapConfirm(context),
                  icon: const Icon(Icons.done),
                ),
                const SizedBox(height: 52),
              ],
            ),
          );
        },
      ),
    );
  }
}
