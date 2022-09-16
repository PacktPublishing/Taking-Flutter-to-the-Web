import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_academy/infrastructure/res/appwrite.service.dart';

class AuthService {
  late final Account account;

  AuthService() : account = Account(AppwriteService.instance.client);

  Future<model.Session>login(String email, String password) {
    return account.createEmailSession(email: email, password: password);
  }
}
