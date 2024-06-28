import 'package:http/http.dart' as http;
import 'package:taskwave/config/api/api_const.dart';
import 'package:taskwave/config/api/end_points.dart';
import 'package:taskwave/models/user_profile.dart';
import 'dart:convert';
import '../models/user.dart';


class AuthService {
  final String baseUrl = ApiConst.taskPath;
  final String appAuth = EndPoints.APP_AUTH;

  Future<User?> login(String username, String password) async {
    
    final url = Uri.parse('$baseUrl/$appAuth');
    print(url);
    
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to login help');
    }
  }

  //  Future<UserProfile> fetchUserData(String accessToken, id) async {
  //   final url = Uri.parse('$baseUrl/view-user/$id');
  //   print(url);
    
  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         'Authorization': 'Bearer $accessToken',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       return UserProfile.fromJson(jsonData); // Suponiendo que User tiene un constructor fromJson para parsear el JSON
  //     } else {
  //       throw Exception('Failed to fetch user data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to fetch user data: $e');
  //   }
  // }
}