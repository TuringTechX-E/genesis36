import 'package:flutter/material.dart';
import 'modules/auth/presentation/authentication_screen.dart';  // Assuming the auth screen is located here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genesis360 App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),  // Set the AuthenticationScreen as the home page
    );
  }
}
