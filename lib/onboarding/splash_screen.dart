import 'package:flutter/material.dart';
import 'package:handyman/View/style.dart';

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
