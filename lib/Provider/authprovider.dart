import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/Service/postapi.dart';
import 'package:handyman/View/style.dart';

import '../Service/helper.dart';

final authRepo = Provider<AuthProvider>((ref) => AuthProvider(ref));

class AuthProvider extends StateNotifier with Ui {
  AuthProvider(super.state);
  int isSignup = 0;
  String authToken = '';

  Future<Map<String, dynamic>> signup(Map body, context, WidgetRef refs) async {
    bool load = true;
    bool done = false;
    String accessToken = '';
    String url = 'users/registration/';
    closeKeyboard(context);

    await Helper(url: url).helperPost(body).then((value) async {
      load = false;
      await value.fold((l) {
        // updateLoadLogin(false);
      }, (r) async {
        if (kDebugMode) {
          print(r.body);
          print(r.statusCode);
        }
        // print(r.body);
        if (r.statusCode == 201 || r.statusCode == 200) {
          accessToken = jsonDecode(r.body)['access'];
          snackBar('registration successfully completed', context);

          done = true;
          // navW(context, const LoginPage());
        } else {
          Map body = jsonDecode(r.body);
          var snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Builder(builder: (context) {
              try {
                assert(body[body.keys.first][0].length > 1);
                return Text(
                  body[body.keys.first][0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              } catch (e) {
                return const Text(
                  'Error in Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              }
            }),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // errorAlert('on data');
      });
    });
    return {'load': load, 'done': done, 'accessToken': accessToken};
  }

  Future<Map<String, dynamic>> login(String email, String password,
      String username, context, WidgetRef refs) async {
    bool load = true;
    bool done = false;
    String accessToken = '';

    closeKeyboard(context);

    await PostApi(body: {}, url: '')
        .loginApi(email, password, username)
        .then((value) async {
      load = false;
      await value.fold((l) {
        // updateLoadLogin(false);
      }, (r) async {
        var responseBody = await r.stream.bytesToString();

        // print(r.body);
        if (r.statusCode == 201 || r.statusCode == 200) {
          accessToken = jsonDecode(responseBody)['data']['access_token'];
          // snackBar('registration successfully completed', context);

          done = true;
          // navW(context, const LoginPage());
        } else {
          Map body = jsonDecode(responseBody)['message'];
          var snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Builder(builder: (context) {
              try {
                assert(body[body.keys.first][0].length > 1);
                return Text(
                  body[body.keys.first][0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              } catch (e) {
                return const Text(
                  'Error in Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              }
            }),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // errorAlert('on data');
      });
    });
    return {'load': load, 'done': done, 'accessToken': accessToken};
  }
}
