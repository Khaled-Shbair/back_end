import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences/sharedPreferencesController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () async {
            await _confirmLogout();
          },
          icon: const Icon(Icons.login, color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(SharedPreferencesController().email),
      ),
    );
  }

  Future<void> _confirmLogout() async {
    bool? logOut = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
    if (logOut ?? false) {
      await logout();
    }
  }

  Future<void> logout() async {
    bool cleared = await SharedPreferencesController().clear();
    if (cleared) {
      Navigator.pushNamed(context, '/LoginScreen');
    }
  }
}
