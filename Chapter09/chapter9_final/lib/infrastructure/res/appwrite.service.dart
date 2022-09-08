import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static AppwriteService instance = appwriteService;
  final Client client;

  AppwriteService() : client = Client() {
    client
      .setEndpoint('https://8080-appwrite-integrationfor-458k5xf89zx.ws-us45.gitpod.io/v1')
      .setProject('6262cb3133564441c02d');
  }
}

final appwriteService = AppwriteService();
