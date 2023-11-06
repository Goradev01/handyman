import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/View/Auth/User/login.dart';
import 'package:handyman/View/Handymen/homepage.dart';
import 'package:handyman/View/formwidget.dart';
import 'package:handyman/View/style.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> with Ui {
  int process = 0;
  FormWidget? fullName;
  FormWidget? email;
  FormWidget? phoneNo;
  FormWidget? service;
  String password = '';
  bool showPassword = false;
  String password2 = '';
  bool showPassword2 = false;
  bool isChecked = false;
  bool load = false;

  @override
  void initState() {
    super.initState();

    fullName = FormWidget(inputText: '', text: 'Full name', context: context);
    email = FormWidget(inputText: '', text: 'Enter Email', context: context);
    service = FormWidget(
        inputText: '', text: 'Services you provide', context: context);
    phoneNo =
        FormWidget(inputText: '', text: 'Enter Phone Number', context: context);
    phoneNo!.keyboard = TextInputType.number;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Consumer(builder: (_, ref, __) {
        return Column(
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
            phoneNo!.textField(),
            email!.textField(),
            service!.textField(),
            // Padding(
            //   padding: pSymmetric(10, 0),
            //   child: Column(
            //     crossAxisAlignment: cStart,
            //     children: [
            //       input(grey61, 12, "Password", w700),
            //       hspacer(5),
            //       Container(
            //         width: width(context),
            //         height: 54,
            //         alignment: left,
            //         padding: const EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //             borderRadius: borderR(8),
            //             border: Border.all(
            //               color: const Color(0xffD5D5D5),
            //               width: 1,
            //             )),
            //         child: Row(
            //           mainAxisAlignment: mBtw,
            //           children: [
            //             SizedBox(
            //               width: width(context) * 0.6,
            //               child: TextField(
            //                 obscureText: showPassword,
            //                 onChanged: (val) {
            //                   setState(() {
            //                     password = val;
            //                   });
            //                 },
            //                 decoration: const InputDecoration(
            //                   // suffix: Icon(Icons.remove_red_eye),
            //                   // labelText: 'Email address',
            //                   border: InputBorder.none,
            //                   labelStyle: TextStyle(color: Colors.grey),
            //                   // errorText: validmail(email),
            //                 ),
            //               ),
            //             ),
            //             showPassword
            //                 ? IconButton(
            //                     icon: Icon(
            //                       Icons.visibility,
            //                       color: grey66,
            //                     ),
            //                     onPressed: () {
            //                       setState(
            //                         () => showPassword = !showPassword,
            //                       );
            //                     })
            //                 : IconButton(
            //                     icon: Icon(
            //                       Icons.visibility_off,
            //                       color: grey66,
            //                     ),
            //                     onPressed: () {
            //                       setState(
            //                         () => showPassword = !showPassword,
            //                       );
            //                     })
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Padding(
            //   padding: pSymmetric(10, 0),
            //   child: Column(
            //     crossAxisAlignment: cStart,
            //     children: [
            //       input(grey61, 12, "Confirm Password", w700),
            //       hspacer(5),
            //       Container(
            //         width: width(context),
            //         height: 54,
            //         alignment: left,
            //         padding: const EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //             borderRadius: borderR(8),
            //             border: Border.all(
            //               color: const Color(0xffD5D5D5),
            //               width: 1,
            //             )),
            //         child: Row(
            //           mainAxisAlignment: mBtw,
            //           children: [
            //             SizedBox(
            //               width: width(context) * 0.6,
            //               child: TextField(
            //                 obscureText: showPassword2,
            //                 onChanged: (val) {
            //                   setState(() {
            //                     password2 = val;
            //                   });
            //                 },
            //                 decoration: const InputDecoration(
            //                   // suffix: Icon(Icons.remove_red_eye),
            //                   // labelText: 'Email address',
            //                   border: InputBorder.none,
            //                   labelStyle: TextStyle(color: Colors.grey),
            //                   // errorText: validmail(email),
            //                 ),
            //               ),
            //             ),
            //             showPassword
            //                 ? IconButton(
            //                     icon: Icon(
            //                       Icons.visibility,
            //                       color: grey66,
            //                     ),
            //                     onPressed: () {
            //                       setState(
            //                         () => showPassword2 = !showPassword2,
            //                       );
            //                     })
            //                 : IconButton(
            //                     icon: Icon(
            //                       Icons.visibility_off,
            //                       color: grey66,
            //                     ),
            //                     onPressed: () {
            //                       setState(
            //                         () => showPassword2 = !showPassword2,
            //                       );
            //                     })
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // // address!.textField(),

            // Builder(builder: (context) {
            //   Color getColor(Set<MaterialState> states) {
            //     return green;
            //   }

            //   return Row(
            //     children: [
            //       Checkbox(
            //         checkColor: Colors.white,
            //         fillColor: MaterialStateProperty.resolveWith(getColor),
            //         value: isChecked,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             isChecked = value!;
            //           });
            //         },
            //       ),
            //       Flexible(
            //         child: RichText(
            //           text: TextSpan(
            //             style: const TextStyle(
            //                 color: Color(0xff121212),
            //                 fontFamily: 'Worksan',
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w500),
            //             children: <TextSpan>[
            //               const TextSpan(
            //                 text: "I agree to company's ",
            //               ),
            //               TextSpan(
            //                   text: 'terms of use',
            //                   style: TextStyle(
            //                       decoration: TextDecoration.underline,
            //                       decorationColor: green,
            //                       color: green)),
            //               const TextSpan(
            //                 text: " and ",
            //               ),
            //               TextSpan(
            //                   text: 'privacy policy',
            //                   style: TextStyle(
            //                     color: green,
            //                     decoration: TextDecoration.underline,
            //                     decorationColor: green,
            //                   )),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
            // }),

            hspacer(20),
            GestureDetector(
                onTap: () async {
                  // setState(() {
                  //   load = true;
                  // });
                  // Map body = {
                  //   "username": fullName!.inputText!,
                  //   "email": email!.inputText,
                  //   "password1": password,
                  //   "password2": password2,
                  // };
                  // var repo = ref.watch(authRepo);
                  // var done = await repo.signup(body, context, ref);
                  nav(context, const HandyManHomepage());
                  // setState(() {
                  //   load = done['load'];

                  //   repo.isSignup = done['done'] ? 1 : 0;
                  //   repo.authToken = done['accessToken'];
                  // });
                  // pagecontrl.nextPage(
                  //     duration: const Duration(seconds: 1),

                  //     curve: Curves.bounceInOut);
                },
                child: button(
                    load ? buttonLoading() : commonText('Next', white), green)),
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
        );
      }),
    ));
  }
}
