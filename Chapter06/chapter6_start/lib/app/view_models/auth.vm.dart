import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/user.vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthVM extends ChangeNotifier {
  bool isLoggedIn = false;
  String error = '';
  UserVM? user;

  bool login({required String email, required String password}) {
    if (email == 'test@email.com' && password == 'testpass') {
      error = '';
      user = UserVM(email: 'test@email.com', name: 'Test User');
      isLoggedIn = true;
      notifyListeners();
      return true;
    }
    error = 'Invalid credentials';
    return false;
  }

  bool logout() {
    if (!isLoggedIn) {
      error = 'Not logged in';
      return false;
    }
    error = '';
    user = null;
    isLoggedIn = false;
    notifyListeners();
    return true;
  }
}

final authVM = ChangeNotifierProvider<AuthVM>((ref) => AuthVM());
