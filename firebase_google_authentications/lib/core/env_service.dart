import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  static Future<void> init() async{
    await dotenv.load(fileName: "assets/.env");
  }

  static String get ApiKey => dotenv.get("API_KEY");
}