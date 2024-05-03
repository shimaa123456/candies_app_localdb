
import 'package:candies_db/features/auth/forget/view/page/forget_page.dart';
import 'package:candies_db/features/auth/login/view/page/login_page.dart';
import 'package:candies_db/features/auth/onbording/view/page/onbording_page.dart';
import 'package:candies_db/features/auth/registration/view/page/registeration_page.dart';
import 'package:candies_db/features/auth/reset/view/page/reset_page.dart';
import 'package:candies_db/features/auth/start/view/page/start_page.dart';
import 'package:candies_db/features/auth/verificationn/view/page/verification_page.dart';
import 'package:candies_db/features/dashboard/modules/cart/view/page/cart_page.dart';
import 'package:candies_db/features/dashboard/modules/details/view/page/detail_page.dart';
import 'package:candies_db/features/dashboard/modules/logout/view/page/logout_page.dart';
import 'package:candies_db/features/dashboard/modules/order/view/page/order_page.dart';
import 'package:flutter/material.dart';
import '../../features/dashboard/view/page/dashboard_page.dart';

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const StartPage(),
    ),
    //  MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => const LoginPage(),
    //   ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>const LoginPage(),
        );

      case '/':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegistrationPage(),
        );
      case '/onbording':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBordingPage(),
        );
      case '/forget':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ForgetPage(),
        );
      case '/reset':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ResetPage(),
        );
      case '/verfication':
      
      final List data= settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  VerificationPage(userName: data[0] as String,),
        );
      case '/home':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const Dashboard(),
        );
        case '/order':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OrderPage(),
        );
         case '/logout':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const LogOutPage(),
        );
         case '/cart':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const CartPage(),
        );
        case '/detail':
        final Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  DetailPage(
            image: data['image'] as String,
            name: data['name'] as String,
            price: data['price'] as String,),
        );
       
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const StartPage(),
        );
    }
  }
}
