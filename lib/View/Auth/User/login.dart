import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman/TabComponent/homepage.dart';
import 'package:handyman/View/Auth/User/register.dart';
import 'package:handyman/View/formwidget.dart';
import 'package:handyman/View/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Ui {
  FormWidget? email;
  FormWidget? username;
  String password = '';
  bool showPassword = false;
  bool load = false;

  @override
  void initState() {
    super.initState();

    email = FormWidget(inputText: '', text: 'Email Address', context: context);
    username = FormWidget(inputText: '', text: 'Username', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return innnerLayout(Column(
      crossAxisAlignment: cStart,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/login.svg',
            width: width(context),
            fit: BoxFit.fill,
          ),
        ),
        input(black47, 28, 'Welcome Back, Karis', w700),
        input(grey66, 14,
            'We’re glad you’re back. To use your account please login.', w400),
        hspacer(15),
        email!.textField(),
        username!.textField(),
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
                              setState(
                                () => showPassword = !showPassword,
                              );
                            })
                        : IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: grey66,
                            ),
                            onPressed: () {
                              setState(
                                () => showPassword = !showPassword,
                              );
                            })
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: right,
          child: Text(
            'Forget password?',
            style: TextStyle(
                color: green,
                fontSize: 14,
                fontWeight: w400,
                decoration: TextDecoration.underline,
                decorationColor: green),
          ),
        ),
        hspacer(20),
        Consumer(builder: (_, ref, __) {
          return GestureDetector(
              onTap: () async {
                nav(context, const HomePage());
                // setState(() {
                //   load = true;
                // });
                // Map<String, String> body = {
                //   'username': 'Adeyemi',
                //   'email': 'goradeveloper@gmail.com',
                //   "password1": password,
                // };
                // var repo = ref.watch(authRepo);
                // var done = await repo.login(email!.inputText!, password,
                //     username!.inputText!, context, ref);

                // setState(() {
                //   load = done['load'];

                //   repo.authToken = done['accessToken'];
                //   var user = Jwt.parseJwt(repo.authToken);
                //   log(user.toString());
                // });
              },
              child: button(
                  load ? buttonLoading() : commonText('Log in', white), green));
        }),
        GestureDetector(
          onTap: () {
            nav(context, const RegisterScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                      color: black1f,
                      fontSize: 14,
                      fontWeight: w400,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    'Sign Up',
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
        Center(child: SvgPicture.asset('assets/fingerprint.svg'))
      ],
    ));
  }
}
