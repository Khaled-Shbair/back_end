import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';
import '../shared_preferences/sharedPreferencesController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.login,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<LanguageProvider>(context, listen: false)
              .changeLanguage();
        },
        child: const Icon(Icons.language),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.enter_email_password,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailEditingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: AppLocalizations.of(context)!.email,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordEditingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                hintText: AppLocalizations.of(context)!.password,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _performLogin();
              },
              child: Text(AppLocalizations.of(context)!.login),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter email & Password!'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  void _login() async {
    await SharedPreferencesController()
        .save(email: _emailEditingController.text);
    Navigator.pushNamed(context, '/HomeScreen');
  }
}
