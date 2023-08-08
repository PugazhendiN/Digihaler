import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inhaler_mobile/common/api_endpoint.dart';

class AuthService {
  Future<String> getCsrfToken() async {
    try {
      final response = await http.get(Uri.parse(APIEndpoint.csrfToken));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final csrfToken = responseData['csrfToken'];
        return csrfToken;
      } else {
        throw Exception(
            'Failed to fetch CSRF token. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching CSRF token: $e');
    }
  }

  Future<dynamic> login(String username, String password) async {
    final token = await getCsrfToken();
    final response = await http.post(
      Uri.parse(APIEndpoint.login),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': token,
      },
      body: jsonEncode({
        'username': username,
        'password': password,
        'login_type': 1,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final authToken = responseData['auth_token'];
      final userId = responseData['user_id'];
      print('Logged in successfully. Auth Token: $authToken, User ID: $userId');
      return responseData;
      // Store the auth token and user_id for subsequent requests or app sessions
    } else {
      throw Exception('Login failed. Status Code: ${response.statusCode}');
    }
  }
// Add other authentication-related functions here
}
