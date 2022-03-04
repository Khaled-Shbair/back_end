import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String text = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_MassageProvider>(
      create: (context) => _MassageProvider(),
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
    return Text(Provider.of<_MassageProvider>(context).massage);
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => 'ScaffoldBody',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppMassage(),
          TextFiledProvider(),
        ],
      ),
    );
  }
}

class AppMassage extends StatelessWidget {
  const AppMassage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<_MassageProvider>(context).massage);
  }
}

class TextFiledProvider extends StatelessWidget {
  const TextFiledProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) {
        Provider.of(context, listen: false).changeMassage(value);
      },
    );
  }
}

class _MassageProvider extends ChangeNotifier {
  String massage = 'Welcome Khaled';

  void changeMassage(String massage) {
    this.massage = massage;
    notifyListeners();
  }
}
