import 'package:flutter/material.dart';
import 'package:handyman/View/Auth/User/login.dart';
import 'package:handyman/View/formwidget.dart';
import 'package:handyman/View/style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with Ui {
  int process = 0;
  FormWidget? fullName;
  FormWidget? email;
  FormWidget? address;
  String password = '';
  bool showPassword = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    fullName = FormWidget(inputText: '', text: 'Full Name', context: context);
    email = FormWidget(inputText: '', text: 'Email Address', context: context);
    address = FormWidget(inputText: '', text: 'Your Address', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          Padding(
            padding: pSymmetric(15, 0),
            child: Column(
              crossAxisAlignment: cStart,
              children: [
                input(black47, 28, 'Create Account', w700),
                input(grey66, 14, 'Please use the correct information here',
                    w400),
              ],
            ),
          ),
          fullName!.textField(),
          email!.textField(),
          Padding(
            padding: pSymmetric(10, 0),
            child: Column(
              crossAxisAlignment: cStart,
              children: [
                input(grey61, 12, "Password", w700),
                hspacer(5),
                Container(
                  width: width(context),
                  height: 54,
                  alignment: left,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: borderR(8),
                      border: Border.all(
                        color: const Color(0xffD5D5D5),
                        width: 1,
                      )),
                  child: Row(
                    mainAxisAlignment: mBtw,
                    children: [
                      SizedBox(
                        width: width(context) * 0.6,
                        child: TextField(
                          obscureText: showPassword,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          decoration: const InputDecoration(
                            // suffix: Icon(Icons.remove_red_eye),
                            // labelText: 'Email address',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey),
                            // errorText: validmail(email),
                          ),
                        ),
                      ),
                      showPassword
                          ? IconButton(
                              icon: Icon(
                                Icons.visibility,
                                color: grey66,
                              ),
                              onPressed: () {
                                setState(() => {
                                      showPassword = !showPassword,
                                    });
                              })
                          : IconButton(
                              icon: Icon(
                                Icons.visibility_off,
                                color: grey66,
                              ),
                              onPressed: () {
                                setState(() => {
                                      showPassword = !showPassword,
                                    });
                              })
                    ],
                  ),
                ),
              ],
            ),
          ),
          address!.textField(),
          Builder(builder: (context) {
            Color getColor(Set<MaterialState> states) {
              return green;
            }

            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Color(0xff121212),
                          fontFamily: 'Worksan',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        const TextSpan(
                          text: "I agree to company's ",
                        ),
                        TextSpan(
                            text: 'terms of use',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: green,
                                color: green)),
                        const TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                            text: 'privacy policy',
                            style: TextStyle(
                              color: green,
                              decoration: TextDecoration.underline,
                              decorationColor: green,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          hspacer(20),
          GestureDetector(
              onTap: () {
                // pagecontrl.nextPage(
                //     duration: const Duration(seconds: 1),
                //     curve: Curves.bounceInOut);
              },
              child: button(commonText('Next', white), green)),
          GestureDetector(
            onTap: () {
              nav(context, const LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: black1f,
                        fontSize: 14,
                        fontWeight: w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      'Log in',
                      style: TextStyle(
                        color: green,
                        fontSize: 14,
                        fontWeight: w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
