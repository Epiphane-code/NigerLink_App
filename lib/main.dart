import 'package:e_services_niger/controllers/auth_controller.dart';
import 'package:e_services_niger/controllers/localisation_controller.dart';
import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/views/screens/login_page.dart';
import 'package:e_services_niger/views/screens/main_shell.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderController()),

        ChangeNotifierProvider(create: (_) => AuthController()),

        ChangeNotifierProvider(create: (_) => LocalisationController())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // context est disponible ici

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NigerLink',

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8FAF9),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007A4D),
          primary: const Color(0xFF007A4D),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE4ECE8)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF007A4D), width: 1.4),
          ),
        ),
      ),


      home: AuthGate(),
    );
  }

}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    if (auth.isAuthenticated) {
      return const MainShell();
    }

    return const LoginPage();
  }
}
