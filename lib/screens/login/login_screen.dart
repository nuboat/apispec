import 'package:flutter/material.dart';
import 'package:apispec/screens/home/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // In a real app, you'd perform validation and authentication here.
    // For this demo, we'll just navigate to the main page.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const VSCodeHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 80),
                const SizedBox(height: 24),
                textSignIn(),
                const SizedBox(height: 8),
                textSignInAction(),
                const SizedBox(height: 40),
                textFieldEmail(),
                const SizedBox(height: 16),
                textFieldPassword(),
                const SizedBox(height: 32),
                btnSignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text textSignIn() {
    return Text(
      'ลงชื่อเข้าใช้',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Text textSignInAction() {
    return Text(
      'เข้าสู่ระบบ',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
      ),
    );
  }

  TextField textFieldEmail() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'อีเมล',
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextField textFieldPassword() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'รหัสผ่าน',
        prefixIcon: Icon(Icons.lock_outline),
      ),
      obscureText: true,
    );
  }

  ElevatedButton btnSignIn() {
    return ElevatedButton(
      onPressed: _login,
      child: const Text('เข้าสู่ระบบ'),
    );
  }

}
