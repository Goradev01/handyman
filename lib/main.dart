import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/View/style.dart';
import 'package:handyman/onboard.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  Stream<Widget> loading() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield const OnboardScreen();
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handy Man',
      theme: ThemeData(
        fontFamily: 'WorkSan',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Widget>(
          stream: loading(),
          initialData: const SplashScreen(),
          builder: (context, sn) {
            return sn.data!;
          }),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ui().bg,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/splash.png'),
                  Ui().input(Ui().black30, 32, 'HandyMan', Ui().w700)
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: Ui().pSymmetric(30, 0),
            child: Image.asset('assets/powered.png'),
          ),
        ],
      ),
    );
  }
}
