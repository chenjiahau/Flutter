import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:accounting/const/app-info.dart';

class ApiService {
  final String baseUrl = AppInfo.baseUrl;

  ApiService();

  // Combine baseUrl and endpoint
  String _buildUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }

  // Build headers
  Map<String, String> _buildHeaders({
    String? token,
    Map<String, String>? customHeaders,
  }) {
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  Future<dynamic> get(
    String endpoint, {
    String? token,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(_buildUrl(endpoint));
    final response = await http.get(
      uri,
      headers: _buildHeaders(token: token, customHeaders: headers),
    );

    return response;
    ;
  }

  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> body, {
    String? token,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(_buildUrl(endpoint));
    final response = await http.post(
      uri,
      headers: _buildHeaders(token: token, customHeaders: headers),
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> put(
    String endpoint,
    Map<String, dynamic> body, {
    String? token,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(_buildUrl(endpoint));
    final response = await http.put(
      uri,
      headers: _buildHeaders(token: token, customHeaders: headers),
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> delete(
    String endpoint, {
    String? token,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(_buildUrl(endpoint));
    final response = await http.delete(
      uri,
      headers: _buildHeaders(token: token, customHeaders: headers),
    );

    return response;
  }
}
