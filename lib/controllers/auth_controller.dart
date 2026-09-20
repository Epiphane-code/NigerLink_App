import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _user;
  String get user {
    if (_user != null) {
      
      if (_user!.displayName != null) {
        return _user!.displayName!;
      }
    }
    return '';
  }

  bool _isLoading = false;

  String? _error;

  // User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

  bool get isAuthenticated => _user != null;

  AuthController() {
    _authService.authStateChanges.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.register(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      _error = e.code;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.login(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      _error = e.code;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
