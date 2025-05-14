import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:accounting/services/api_service.dart';

class UnauthService extends ApiService {
  UnauthService();

  // [POST] Sign In
  Future<dynamic> signIn(Map<String, dynamic> body) async {
    return await post('/unauth/signin', body);
  }

  // [POST] Sign Up
  Future<dynamic> signUp(Map<String, dynamic> body) async {
    return await post('/unauth/signup', body);
  }
}