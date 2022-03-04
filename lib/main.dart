import 'package:back_end/provider/language_provider.dart';
import 'package:back_end/screen/home_screen.dart';
import 'package:back_end/screen/login_screen.dart';
import 'package:back_end/screen/lunch_screen.dart';
import 'package:back_end/shared_preferences/sharedPreferencesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initPref();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //  Provider<String>(create: (context) => 'massage'),
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider()),
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // localizationsDelegates: const [
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      // ],
      supportedLocales: AppLocalizations.supportedLocales,
      // supportedLocales: const [
      //   Locale('ar'),
      //   Locale('en'),
      // ],
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      initialRoute: '/LunchScreen',
      routes: {
        '/LunchScreen': (context) => const LunchScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
