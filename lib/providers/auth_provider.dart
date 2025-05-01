import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuth = false;
  String? _token;
  String? _userId;

  bool get isAuth => _isAuth;
  String? get token => _token;
  String? get userId => _userId;

  Future<void> login(String email, String password) async {
    // Burada gerçek bir API çağrısı yapılacak
    // Şimdilik basit bir kontrol yapıyoruz
    if (email.isNotEmpty && password.isNotEmpty) {
      _isAuth = true;
      _token = 'dummy_token';
      _userId = 'dummy_user_id';
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('userId', _userId!);
      
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    // Burada gerçek bir API çağrısı yapılacak
    // Şimdilik basit bir kontrol yapıyoruz
    if (email.isNotEmpty && password.isNotEmpty) {
      _isAuth = true;
      _token = 'dummy_token';
      _userId = 'dummy_user_id';
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('userId', _userId!);
      
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isAuth = false;
    _token = null;
    _userId = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }

    _token = prefs.getString('token');
    _userId = prefs.getString('userId');
    _isAuth = true;
    notifyListeners();
    return true;
  }
} 