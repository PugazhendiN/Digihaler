import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  Future<String> getCsrfToken() async {
    final url = 'http://10.0.2.2:8000/get-csrf-token/'; // Replace with your Django CSRF token API endpoint

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final csrfToken = responseData['csrfToken'];
        return csrfToken;
      } else {
        throw Exception('Failed to fetch CSRF token. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching CSRF token: $e');
    }
  }



  Future<bool> login(String username, String password) async {
    final url = 'http://10.0.2.2:8000/api/login/';
    final token = await getCsrfToken();
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // Include the CSRF token if your Django backend requires it
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
      return true;
      // Store the auth token and user_id for subsequent requests or app sessions
    } else {
      throw Exception('Login failed. Status Code: ${response.statusCode}');
    }
  }


// Add other authentication-related functions here
}
