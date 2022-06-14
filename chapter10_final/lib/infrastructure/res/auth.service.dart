import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_academy/infrastructure/res/appwrite.service.dart';

class AuthService {
  late final Account account;

  AuthService() : account = Account(AppwriteService.instance.client);

  Future<Session>login(String email, String password) {
    return account.createSession(email: email, password: password);
  }
}
