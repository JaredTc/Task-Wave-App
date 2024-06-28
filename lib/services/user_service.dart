import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskwave/config/api/api_const.dart';
import 'package:taskwave/models/user_profile.dart';

class UserService {

 final String baseUrl = ApiConst.taskPath;
 
    Future<UserProfile> fetchUserData( id) async {
    final url = Uri.parse('$baseUrl/view-user/$id');
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return UserProfile.fromJson(jsonData); 
      } else {
        throw Exception('Failed to fetch user data');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}