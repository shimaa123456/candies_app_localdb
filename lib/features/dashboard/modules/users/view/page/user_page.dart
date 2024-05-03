
import 'package:candies_db/features/dashboard/modules/users/controller/user_cubit.dart';
import 'package:candies_db/features/dashboard/modules/users/view/components/user_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final UserCubit controller = context.read<UserCubit>();

          return Scaffold(
            body: state is UserLoading
                ? const Center(child: CircularProgressIndicator())
                : state is UserEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.grey,
                        ),
                      )
                    : SafeArea(
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Users Of Our Cookies Store",
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
                                padding: const EdgeInsets.all(8.0),
                                child:ListView.builder(
                                  padding: const EdgeInsets.all(12),
                                  itemCount: controller.users.length,
                                  itemBuilder: (_, int index) {
                                  return UserItemWidget(userModel: controller.users[index]);
                                   },
                                ), 
                              ),
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
