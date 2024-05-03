import 'package:candies_db/core/utlis/routes_page.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:candies_app/features/auth/forget/view/page/forget_page.dart';
// import 'package:candies_app/features/auth/home/view/page/home_page.dart';
// import 'package:candies_app/features/auth/login/view/page/login_page.dart';
// import 'package:candies_app/features/auth/onbording/view/page/onBording_page.dart';
// import 'package:candies_app/features/auth/registration/view/page/registeration_page.dart';
// import 'package:candies_app/features/auth/reset/view/page/reset_page.dart';
// import 'package:candies_app/features/auth/verfication/view/page/verfication_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Candies Shop',
//       initialRoute: '/onbording',
//       routes: {
//         '/': (context) =>  RegistrationPage(),
//         '/onbording': (context) =>  OnBordingPage(),
//         '/login': (context) =>  LoginPage(),
//         '/forget': (context) =>  ForgetPage(),
//          '/reset': (context) =>  ResetPage(),
//           '/verfication': (context) =>  VerficationPage(),
//           '/home': (context) =>  HomePage(),

//       },
//     );
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

//   bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

//   MaterialApp materialApp = MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'Candies Shop',
//     home: onBoarding ? const RegistrationPage() :  OnBordingPage(),
//   );

//   runApp(materialApp);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onbording = sharedPreferences.getBool('onbording') ?? false;

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Candies Shop',
        // initialRoute:'/home',
        initialRoute: onbording
            ? '/start'
            : '/onbording',
        onGenerateRoute: MyRoutes.onGenerateRoute,
      ), // Wrap your app
    ),
  );
}
