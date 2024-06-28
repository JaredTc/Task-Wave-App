
import '../services/auth_service.dart';
import '../models/user.dart';

class AuthRepository {
  final AuthService authService;


  AuthRepository( {required this.authService});

  Future<User?> login(String username, String password) async {
    return await authService.login(username, password);
  }


  

}