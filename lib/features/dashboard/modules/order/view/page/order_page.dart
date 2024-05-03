
import 'package:candies_db/features/dashboard/modules/order/controller/cubit/order_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/order_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OrderControllerCubit>(
        create: (context) => OrderControllerCubit(),
        child: BlocBuilder<OrderControllerCubit, OrderControllerState>(
          builder: (context, state) {
            final OrderControllerCubit controller = context.read<OrderControllerCubit>();
          return Scaffold(
            backgroundColor: Color(0xfffec5c5),
            body: OrderBody(controller: controller,),
          );
        },
      ),
    ));
  }
}
