import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }
}
