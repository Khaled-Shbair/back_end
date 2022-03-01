import 'package:back_end/screen/home_screen.dart';
import 'package:back_end/screen/login_screen.dart';
import 'package:back_end/screen/lunch_screen.dart';
import 'package:back_end/shared_preferences/sharedPreferencesController.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initPref();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LunchScreen',
      routes: {
        '/LunchScreen': (context) => const LunchScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
