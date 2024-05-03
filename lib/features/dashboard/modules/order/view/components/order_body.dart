
import 'package:candies_db/core/utlis/validation.dart';
import 'package:candies_db/features/dashboard/modules/order/controller/cubit/order_controller_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OrderBody extends StatelessWidget {
  OrderBody({super.key, required this.controller});
  final OrderControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffa6010f),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfffdfefe)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Order',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xfffefefe))),
      ),
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: BlocProvider.value(
          value: controller,
          child: BlocBuilder<OrderControllerCubit, OrderControllerState>(
          builder: (context, state) {
          OrderControllerCubit controller = context.read<OrderControllerCubit>();
            return Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * .3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/c1.jpg'),
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            top: 10,
                            left: 20,
                            child: Text(
                              'Your Order...',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffa6010f),
                              ),
                            ),
                          ),
                          ///////////////////name
                          Positioned(
                              top: 50,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.person,
                                        color: Color.fromARGB(255, 223, 51, 88),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        width: 300,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: controller.nameController,
                                          keyboardType: TextInputType.name,
                                          validator:
                                            RegistrationValidator().validateUserName,
                                          cursorColor: Colors.grey,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Your Name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )),
                          //delivery address
                          Positioned(
                              top: 120,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color.fromARGB(255, 223, 51, 88),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        width: 300,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: controller.addressController,
                                          keyboardType: TextInputType.streetAddress,
                                          validator:
                                            RegistrationValidator().validateAddress,
                                          cursorColor: Colors.grey,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Delivery Adress',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )),

                          //////////phone
                          Positioned(
                            top: 190,
                            left: 20,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.phone,
                                      color: Color.fromARGB(255, 223, 51, 88),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: 300,
                                      child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: controller.phoneController,
                                          keyboardType: TextInputType.phone,
                                          validator:
                                            RegistrationValidator().validatePhone,
                                        cursorColor: Colors.grey,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          letterSpacing: 1.4,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Phone',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * .8,
                                  child: const Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: -5,
                            right: 30,
                            child: Container(
                              padding: const EdgeInsets.all(22),
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffa6010f),
                                      Color(0xfff65f6b),
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                child: Image.asset(
                                    'assets/images/right-arrow.png'),
                                onTap: () => controller.addUser(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
