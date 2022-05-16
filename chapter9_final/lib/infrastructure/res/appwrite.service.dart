import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static AppwriteService instance = appwriteService;
  final Client client;

  AppwriteService() : client = Client() {
    client.setEndpoint('https://demo.appwrite.io/v1').setProject('projectId');
  }
}

final appwriteService = AppwriteService();
