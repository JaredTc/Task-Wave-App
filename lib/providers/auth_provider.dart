import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskwave/models/user_profile.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  UserProfile? _userProfile;
  String? _accessToken;
  bool _isLogged = false; // Variable para rastrear el estado de inicio de sesión
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  User? get user => _user;
  UserProfile? get userProfile => _userProfile;
  bool get isLogged => _isLogged; // Getter para el estado de inicio de sesión

  Future<void> login(String username, String password) async {
    try {
      _user = await authRepository.login(username, password);
      await _saveAccessToken(_user!.token, _user!.id);
      _isLogged = true; // Establecer el estado de inicio de sesión como verdadero
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<void> _saveAccessToken(String token, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
    await prefs.setInt('id', id);

    print('Token almacenado: $token');
    print('ID almacenado: $id');
  }

  Future<void> loadAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
    if (_accessToken != null) {
      // Si se carga un token, intentar verificar su validez
      // await _verifyToken();
      _isLogged = true; // Establecer el estado de inicio de sesión como verdadero si se carga un token
      notifyListeners();
    }
  }

  Future<void> _deleteAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    _isLogged = false; // Establecer el estado de inicio de sesión como falso al cerrar sesión
  }

  void logout() async {
    _user = null;
    await _deleteAccessToken();
    _isLogged = false; // Establecer el estado de inicio de sesión como falso al cerrar sesión
    notifyListeners();
  }
}