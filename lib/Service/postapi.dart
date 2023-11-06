import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:handyman/Service/baseurl.dart';
import 'package:http/http.dart' as https;

class PostApi {
  final String url;
  final Map body;
  String? userToken;

  PostApi({
    required this.url,
    required this.body,
  });

  Future<Either<Exception, https.Response>> postApi() async {
    try {
      final response = await https.post(
          Uri.parse(
            '${BaseUrl().base}$url',
          ),
          headers: {
            "Content-Type": "multipart/form-data",
          },
          body: const JsonEncoder().convert(body));
      if (kDebugMode) {
        print('${BaseUrl().base}$url');
      }
      log('ggg:${response.body}');

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, https.StreamedResponse>> loginApi(
      String email, String password, String username) async {
    var url = Uri.parse('${BaseUrl().base}/users/login/');

    // Create a new multipart request
    var request = https.MultipartRequest('POST', url);
    request.fields['email'] = email;
    request.fields['username'] = 'Adeyemi';
    request.fields['password'] = password;
    try {
      var response = await request.send();

      // Check if the response is successful (status code 200)
      // var responseBody = await response.stream.bytesToString();

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<void> sendFormData(String email, String password) async {
    var url = Uri.parse('/users/login/');

    // Create a new multipart request
    var request = https.MultipartRequest('POST', url);

    // Add fields (in this case, email and password)
    request.fields['email'] = email;
    request.fields['username'] = 'Adeyemi';
    request.fields['password'] = password;

    // Send the request
  }

  Future<Either<Exception, https.Response>> postApiToken(String token) async {
    try {
      final response = await https.post(
          Uri.parse(
            '${BaseUrl().base}$url',
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token',
          },
          body: const JsonEncoder().convert(body));
      log('${BaseUrl().base}$url');
      log(response.body);
      log(response.statusCode.toString());
      log(token);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
