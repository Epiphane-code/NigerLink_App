import 'package:e_services_niger/controllers/auth_controller.dart';
import 'package:e_services_niger/views/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool obscure = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Vérification des champs
    if (email.text.trim().isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
      return;
    }

    final auth = context.read<AuthController>();

    final success = await auth.login(
      email: email.text.trim(),
      password: password.text,
    );

    if (!mounted) return;

    if (success) {
      // Si vous utilisez AuthGate, vous n'avez normalement
      // pas besoin de Navigator ici.
      //
      // AuthGate détectera automatiquement la connexion
      // Firebase et affichera MainShell.
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_getErrorMessage(auth.error))));
    }
  }

  String _getErrorMessage(String? error) {
    switch (error) {
      case 'invalid-credential':
      case 'invalid-email':
      case 'wrong-password':
      case 'user-not-found':
        return 'Email ou mot de passe incorrect.';

      case 'user-disabled':
        return 'Ce compte a été désactivé.';

      case 'too-many-requests':
        return 'Trop de tentatives. Veuillez réessayer plus tard.';

      case 'network-request-failed':
        return 'Vérifiez votre connexion Internet.';

      default:
        return 'Une erreur est survenue. Veuillez réessayer.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xFF007A4D),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.apps_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'NigerLink',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF006C45),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Votre assistant de services au Niger',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 38),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // EMAIL
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // MOT DE PASSE
                  TextField(
                    controller: password,
                    obscureText: obscure,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _login(),
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: Icon(
                          obscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // MOT DE PASSE OUBLIE
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // À implémenter avec Firebase :
                        // sendPasswordResetEmail()
                      },
                      child: const Text('Mot de passe oublié ?'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // BOUTON CONNEXION
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: auth.isLoading ? null : _login,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF007A4D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: auth.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Se connecter',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // INSCRIPTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Pas encore de compte ?'),
                      TextButton(
                        onPressed: auth.isLoading
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterPage(),
                                  ),
                                );
                              },
                        child: const Text('Créer un compte'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
