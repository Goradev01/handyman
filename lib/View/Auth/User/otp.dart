import 'package:flutter/material.dart';
import 'package:handyman/View/Auth/User/register.dart';
import 'package:handyman/View/formwidget.dart';
import 'package:handyman/View/style.dart';

class OTPSCreen extends StatefulWidget {
  const OTPSCreen({super.key});

  @override
  State<OTPSCreen> createState() => _OTPSCreenState();
}

class _OTPSCreenState extends State<OTPSCreen> with Ui {
  FormWidget? phoneNumber;
  @override
  void initState() {
    phoneNumber =
        FormWidget(inputText: '', text: 'Enter Phone Number', context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pSymmetric(10, 20),
      child: Column(
        mainAxisAlignment: mBtw,
        children: [
          SizedBox(
            height: height(context) - 200,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cStart,
                children: [
                  Padding(
                    padding: pSymmetric(15, 0),
                    child: Column(
                      crossAxisAlignment: cStart,
                      children: [
                        input(black47, 28, 'Almost done!', w700),
                        input(
                            grey66,
                            14,
                            'Please enter your phone number to begin the verification process',
                            w400),
                        phoneNumber!.textField()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                pagecontrl.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceInOut);
              },
              child: button(commonText('Send OTP', white), green)),
          hspacer(70),
        ],
      ),
    );
  }
}
