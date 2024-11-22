import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/network/firebase_utils.dart';
import 'core/utils/theme_manager.dart';
import 'modules/home/presentation/home_screen.dart';
import 'modules/authentication/presentation/auth_screen.dart';
import 'modules/smart_ui/presentation/dynamic_dashboard_screen.dart';
import 'shared/utils/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Start the app
  runApp(const Genesis360App());
}

class Genesis360App extends StatelessWidget {
  const Genesis360App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Theme Manager for Light/Dark Modes
        ChangeNotifierProvider(create: (_) => ThemeManager()),

        // Authentication State Management
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        // Firestore Sync Manager
        ChangeNotifierProvider(create: (_) => FirestoreSyncManager()),

        // Any additional providers for app state
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, _) {
          return MaterialApp(
            title: 'Genesis360',
            theme: themeManager.lightTheme,
            darkTheme: themeManager.darkTheme,
            themeMode: themeManager.themeMode,
            initialRoute: '/auth',
            routes: RouteManager.routes,
          );
        },
      ),
    );
  }
}
