
import 'package:candies_db/core/utlis/context_extension.dart';
import 'package:candies_db/features/dashboard/modules/details/controller/cubit/detail_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DetailBody extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  DetailBody(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.controller});
  DetailControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    int itemCount = 1; // Initial item count
    double totalPrice = double.parse(price); // Initial total price

    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<DetailControllerCubit, DetailControllerState>(
        builder: (context, state) {
          if (state is ItemChanged) {
            // Update total price if state is ItemChanged
            totalPrice = state.totalPrice;
            itemCount = state.itemCount;
          }
          return Column(
            children: [
              Container(
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: context.height / 28,
                          ),
                          const Text(
                            "Your Cookie Details",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 4.0,
                                  color: Color.fromARGB(128, 219, 18, 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.height / 18,
                          ),
                          Hero(
                            tag: name,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13.0),
                              child: Image.asset(
                                image,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.height / 28,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 246, 31, 42),
                            ),
                          ),
                          SizedBox(
                            height: context.height / 58,
                          ),
                          Text(
                            'Price: \$$price',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 253, 61, 138),
                            ),
                          ),
                          SizedBox(
                            height: context.height / 98,
                          ),
                          const Text(
                            'Freshly baked cookies are the ultimate comfort food, offering a delightful combination of crispy edges and soft centers that melt in your mouth',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: context.height / 48,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    // onPressed: () {
                                    // if (itemCount > 1) {
                                    //   // Decrease item count and update total price
                                    //   itemCount--;
                                    //   totalPrice -= double.parse(price);
                                    // }},
                                    onPressed: () =>
                                        controller.decreaseQuantity(
                                            price, totalPrice, itemCount),

                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text(
                                    state is ItemChanged
                                        ? state.itemCount.toStringAsFixed(2)
                                        : '1',
                                    // '$itemCount',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        controller.increaseQuantity(
                                            price, totalPrice, itemCount),
                                    // onPressed: () {
                                    //   // Increase item count and update total price
                                    //   itemCount++;
                                    //   totalPrice += double.parse(price);
                                    // },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              Text(
                                state is ItemChanged
                                    ? state.totalPrice.toStringAsFixed(2)
                                    : '\$ $price',

                                // '\$$totalPrice', // Display total price here
                                style: const TextStyle(fontSize: 20),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (state is ItemChanged) {
                                    print('$name ,$totalPrice ,$itemCount');
                                    controller.onPressedCartButton(
                                        context,
                                        image,
                                        name,
                                        totalPrice ,
                                        itemCount);
                                  } else {
                                    print('$name , $totalPrice ,$itemCount');
                                    controller.onPressedCartButton(
                                        context,
                                        image,
                                        name,
                                        totalPrice,
                                        itemCount );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent,
                                ),
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
