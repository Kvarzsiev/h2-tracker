import 'package:h2_tracker_client/h2_tracker_client.dart';

class UserStateService {
  // private static instance of the class
  static final UserStateService _instance = UserStateService._internal();

  // Private constructor to prevent external instantiation
  UserStateService._internal();

  // Factory constructor to return the same instance
  factory UserStateService() {
    return _instance;
  }

  Pessoa? user;
}
