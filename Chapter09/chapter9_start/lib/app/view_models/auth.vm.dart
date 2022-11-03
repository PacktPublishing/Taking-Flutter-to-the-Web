import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/user.vm.dart';
import 'package:flutter_academy/infrastructure/res/appwrite.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthVM extends ChangeNotifier {
  final Account account = Account(AppwriteService.instance.client);
  bool isLoggedIn = false;
  String error = '';
  UserVM? user;

  AuthVM() {
    getUser();
  }

  Future<bool> getUser() async {
    try {
      final apUser = await account.get();
      user = UserVM(email: apUser.email, name: apUser.name, id: apUser.$id);
      isLoggedIn = true;
      notifyListeners();
      return true;
    } on AppwriteException catch (e) {
      isLoggedIn = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      await account.createEmailSession(email: email, password: password);
      final apUser = await account.get();
      user = UserVM(email: apUser.email, name: apUser.name, id: apUser.$id);
      isLoggedIn = true;
      notifyListeners();
      return true;
    } on AppwriteException catch (e) {
      error = e.message ?? e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await account.create(
          userId: 'unique()', name: name, email: email, password: password);
      await login(email: email, password: password);
      return true;
    } on AppwriteException catch (e) {
      error = e.message ?? e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> anonymousLogin() async {
    if (isLoggedIn) {
      error = 'Already logged in';
      return false;
    }
    error = '';
    try {
      await account.createAnonymousSession();
      final apUser = await account.get();
      user = UserVM(email: 'N/A', name: 'Anonymous User', id: apUser.$id);
      isLoggedIn = true;
      notifyListeners();
      return true;
    } on AppwriteException catch (e) {
      error = e.message ?? 'Unknown error';
      return false;
    }
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
