import 'dart:convert';
import 'package:appknit/app/data/secrets.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
      '${thryveKey}login',
    );
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return {
      "statusCode": response.statusCode,
      "body": jsonDecode(response.body),
    };
  }
}
