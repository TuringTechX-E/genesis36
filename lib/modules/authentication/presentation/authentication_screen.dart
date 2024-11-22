import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isBiometricSupported = false;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();

    // Initialize animation controller for button effects
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkBiometricSupport() async {
    bool isSupported = await _localAuth.canCheckBiometrics;
    setState(() {
      _isBiometricSupported = isSupported;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    try {
      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access Genesis360',
        options: const AuthenticationOptions(useErrorDialogs: true, stickyAuth: true),
      );
      if (authenticated) {
        _onSuccessfulLogin();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void _onSuccessfulLogin() {
    // Trigger button animation and navigate to the main app dashboard
    _animationController.forward().then((_) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo or Title with subtle pulse effect
            Text(
              'Genesis360',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Secured & Sustainable Access',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),

            // Email/Password Login Fields
            _buildEmailPasswordFields(),

            const SizedBox(height: 20),

            // Remember Me & Login Button with animated glow effect
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckboxListTile(
                  title: const Text('Remember me'),
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                ScaleTransition(
                  scale: _animation,
                  child: ElevatedButton(
                    onPressed: _onSuccessfulLogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Biometric Login Option
            if (_isBiometricSupported)
              Column(
                children: [
                  const Text('Or'),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _authenticateWithBiometrics,
                    icon: const Icon(Icons.fingerprint, size: 24),
                    label: const Text('Login with Biometrics'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.teal.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // OAuth Login Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialLoginButton('Google', Icons.account_circle, Colors.red),
                const SizedBox(width: 16),
                _buildSocialLoginButton('Facebook', Icons.facebook, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the email and password input fields
  Widget _buildEmailPasswordFields() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  /// Builds a social login button with icon and label
  Widget _buildSocialLoginButton(String provider, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () => _onSuccessfulLogin(), // Replace with OAuth logic
      icon: Icon(icon, color: Colors.white),
      label: Text('Sign in with $provider'),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}
