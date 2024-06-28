import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskwave/models/user_profile.dart';
import 'package:taskwave/services/user_service.dart';


class UserRepository {
  final UserService userService;
  String? _accessToken;

  UserRepository({required this.userService});

 Future<void> _loadAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
 
  }

  Future<UserProfile> fetchUserData() async {
    await _loadAccessToken(); 
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final userId = prefs.getInt('id');

    try {
    
        return await userService.fetchUserData( userId!);
  
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
  



}