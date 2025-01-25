import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_google_authentications/application.dart';
import 'package:firebase_google_authentications/firebase_options.dart';
import 'package:flutter/widgets.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Applications());
}
