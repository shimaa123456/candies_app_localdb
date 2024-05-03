import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:candies_db/features/dashboard/modules/about_us/view/page/about_page.dart';
import 'package:candies_db/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:candies_db/features/dashboard/modules/users/view/page/user_page.dart';
import 'package:flutter/cupertino.dart';
import '../../controller/dashboard_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/cart/view/page/cart_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  final List<String> titles = const ['Home', 'Cart', 'About', 'Users'];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardControllerCubit(),
      child: BlocBuilder<DashboardControllerCubit, DashboardControllerState>(
        builder: (context, state) {
          DashboardControllerCubit controller =
              context.read<DashboardControllerCubit>();
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
              title: Text(
                titles[controller.selectedTabIndex],
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xfffefefe),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/order');
                    },
                    icon: const Icon(CupertinoIcons.add,
                        color: Color(0xfffafafb)))
              ],
            ),
            backgroundColor: const Color(0xfffec5c5),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: const [
                HomePage(),
                CartPage(),
                AboutPage(),
                UserPage(),
              ],
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: controller.selectedTabIndex,
              onItemSelected: controller.onChangeTabIndex,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.home),
                  title: const Text('Home'),
                  activeColor: Colors.red,
                  inactiveColor: Colors.red.withOpacity(0.5),
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.cart),
                  title: const Text('Cart'),
                  activeColor: Colors.purple,
                  inactiveColor: Colors.purple.withOpacity(0.5),
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.info),
                  title: const Text('About'),
                  activeColor: Color.fromARGB(255, 100, 151, 5),
                  inactiveColor:
                      Color.fromARGB(255, 100, 151, 5).withOpacity(0.5),
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.person_3),
                  title: const Text('Users'),
                  activeColor: Colors.pink,
                  inactiveColor: Colors.pink.withOpacity(0.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
