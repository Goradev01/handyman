import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/onboard.dart';

import 'onboarding/splash_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'WorkSan',
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
