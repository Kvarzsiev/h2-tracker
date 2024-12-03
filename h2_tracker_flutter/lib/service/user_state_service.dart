import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/main.dart';

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

  Future<void> refresh() async {
    final user = this.user;
    if (user != null) {
      final toRefresh = await client.pessoa.read(user.id!);
      print(toRefresh);
      this.user = toRefresh;
    }
  }
}
