
import 'package:candies_db/features/dashboard/modules/order/view/page/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubit/cart_controller_cubit.dart';
import '../components/cart_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartControllerCubit(),
      child: BlocBuilder<CartControllerCubit, CartControllerState>(
        builder: (context, state) {
          final CartControllerCubit controller =
              context.read<CartControllerCubit>();
             final double totalPrice = controller.calculateTotalPrice();
          return SafeArea(
            child: Scaffold(
              // backgroundColor: const Color(0xfffec5c5),
              body: state is CartLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is CartEmpty
                      ? const Center(
                          child: Icon(
                            CupertinoIcons.delete,
                            size: 100,
                            color: Colors.grey,
                          ),
                        )
                      : SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "My Cart",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 223, 51, 88),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Divider(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListView.builder(
                                    itemCount: controller.carts.length,
                                    padding: const EdgeInsets.all(12),
                                    itemBuilder: (_, int index) {
                                      return CartBody(
                                        cartModel: controller.carts[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 16),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffa6010f),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/home');
                                      },
                                      child: const Text(
                                        "Buy More",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // const SizedBox(height: 3),
                              //total and pay button
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 36, vertical: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffa6010f),
                                  ),
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Price',
                                            style: TextStyle(
                                                color: Colors.green[200],
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          const SizedBox(height: 8),
                                          // total price
                                            Text(
                                            // '\$${value.calculateTotal()}',
                                           // '--',
                                           '\$${totalPrice.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // pay now
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.white), // White border
                                          borderRadius: BorderRadius.circular(
                                              28), // Rounded corners
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context, // Pass the current context
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const OrderPage()), // Specify the target page
                                            );
                                          },
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween, // Space children evenly
                                            children: [
                                              // Make children const for better performance
                                              Text(
                                                'Pay Now',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
