import 'package:flutter/material.dart';
import 'package:taskwave/models/user_profile.dart';
import 'package:taskwave/repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserProfile? _userProfile;

  final UserRepository userRepository;

  UserProvider({required this.userRepository});
  UserProfile? get userProfile => _userProfile;

  Future<void> fetchUserDetails() async {
    _userProfile = await userRepository.fetchUserData();
    notifyListeners();
  }
}
