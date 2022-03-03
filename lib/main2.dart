import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String text = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => text,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const AppBarTitle(),
          ),
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>'ScaffoldBody',
      child: Column(
        children: const [
          AppMassage(),
        ],
      ),
    );
  }
}

class AppMassage extends StatelessWidget {
  const AppMassage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}
