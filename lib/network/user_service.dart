import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inhaler_mobile/common/api_endpoint.dart';
import 'package:inhaler_mobile/models/user_detail.dart';

class UserService {
  Future<UserDetail> fetchUserInfo(int uid) async {
    final url = APIEndpoint.getUserProfile;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // 'X-CSRFToken': token,
      },
      body: jsonEncode({
        // 'username': username,
        // 'password': password,
        'uid': uid,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
      return UserDetail.fromJson(responseData['message']);
    } else {
      throw Exception(
          'Failed to fetch user info. Status Code: ${response.statusCode}');
    }
  }
}
