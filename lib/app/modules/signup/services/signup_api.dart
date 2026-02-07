import 'dart:convert';
import 'package:appknit/app/data/secrets.dart';
import 'package:http/http.dart' as http;

class SignUpApi {
  static Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    final uri = Uri.parse(
      '${thryveKey}signup',
    );

    final request = http.MultipartRequest('POST', uri);
    final dataJson = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
    });
    request.fields['data'] = dataJson;
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return {
      "statusCode": response.statusCode,
      "body": jsonDecode(response.body),
    };
  }
}
