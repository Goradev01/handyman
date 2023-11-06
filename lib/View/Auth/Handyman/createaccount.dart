import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/Provider/authprovider.dart';
import 'package:handyman/View/Auth/Handyman/signup1.dart';
import 'package:handyman/View/Auth/User/otp.dart';
import 'package:handyman/View/Auth/User/otptoken.dart';
import 'package:handyman/View/style.dart';

class CreateAccountHandyman extends StatefulWidget {
  const CreateAccountHandyman({super.key});

  @override
  State<CreateAccountHandyman> createState() => _CreateAccountHandymanState();
}

PageController pagecontrl = PageController();

class _CreateAccountHandymanState extends State<CreateAccountHandyman> with Ui {
  int process = 0;
  PageController pagecontrl = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Consumer(builder: (_, ref, __) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    backNav(context),
                    Row(
                      children: List.generate(
                          3,
                          (index) => Container(
                                width: (width(context) - 100) / 3,
                                margin: pSymmetric(0, 3),
                                height: 6,
                                decoration: BoxDecoration(
                                  borderRadius: borderR(8),
                                  color: ref.watch(authRepo).isSignup == index
                                      ? green
                                      : Colors.grey,
                                ),
                              )),
                    )
                  ],
                ),
              ),
              ref.watch(authRepo).isSignup == 0
                  ? const SignupScreen1()
                  : ref.watch(authRepo).isSignup == 1
                      ? const OTPSCreen()
                      : const OTPToken(),
            ],
          ),
        );
      }),
    ));
  }
}
