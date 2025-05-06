import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  Future<void> login(String email, String password) async {
    // Basit bir mock login işlemi
    if (email.isNotEmpty && password.isNotEmpty) {
      _isAuth = true;
      notifyListeners();
    }
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}