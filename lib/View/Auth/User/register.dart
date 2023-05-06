import 'package:flutter/material.dart';
import 'package:handyman/View/Auth/User/otp.dart';
import 'package:handyman/View/Auth/User/otptoken.dart';
import 'package:handyman/View/Auth/User/signup.dart';
import 'package:handyman/View/style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

PageController pagecontrl = PageController();

class _RegisterScreenState extends State<RegisterScreen> with Ui {
  int process = 0;
  PageController pagecontrl = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
                                  color: process == index ? green : Colors.grey,
                                ),
                              )),
                    )
                  ],
                ),
              ),
              Flexible(
                  child: PageView.builder(
                      controller: pagecontrl,
                      scrollDirection: Axis.horizontal,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      onPageChanged: (v) {
                        setState(() {
                          process = v;
                        });
                      },
                      itemBuilder: (context, index) {
                        List view = [
                          const SignupScreen(),
                          const OTPSCreen(),
                          const OTPToken()
                        ];
                        return view[index];
                      }))
            ],
          ),
        ));
  }
}
