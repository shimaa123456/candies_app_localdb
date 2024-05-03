
import 'package:candies_db/features/dashboard/modules/details/controller/cubit/detail_controller_cubit.dart';
import 'package:candies_db/features/dashboard/modules/details/view/components/detail_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  final String image, price, name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailControllerCubit>(
        create: (context) => DetailControllerCubit(),
        child: BlocBuilder<DetailControllerCubit, DetailControllerState>(
          builder: (context, state) {
            DetailControllerCubit controller =
                context.read<DetailControllerCubit>();
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xfffec5c5),
              body: DetailBody(
                image: image,
                name: name,
                price: price,
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
