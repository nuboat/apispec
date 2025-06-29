import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:apispec/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _authen() {
    Get.to(() => Home(mode: "1"));
  }

  void _guest() {
    _readDirectory().then( (path) {
      if (!File('$path/initiated.txt').existsSync()) {
        new File('$path/initiated.txt')
            .writeAsStringSync(_nowInStr(), flush: true);
        new Directory('$path/applications/Personal')
            .createSync(recursive: true);
        new File('$path/applications/Personal/build_info.rest')
            .writeAsStringSync(_buildInfo, flush: true);
      }
    });

    Get.to(() => Home(mode: "1")); // assume guest
  }

  String _nowInStr() {
    final now = DateTime.now();
    return DateFormat("yyyy-MM-dd kk:mm:ss+0700").format(now);
  }

  Future<String> _readDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
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
                btnSignIn(context),
                const SizedBox(height: 32),
                btnGuest(),
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
      style: TextStyle(fontSize: 16, color: Colors.grey[400]),
    );
  }

  TextField textFieldEmail() {
    return TextField(
      enabled: false,
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
      enabled: false,
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'รหัสผ่าน',
        prefixIcon: Icon(Icons.login),
      ),
      obscureText: true,
    );
  }

  ElevatedButton btnSignIn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => underConstruction()),
      child: const Text('เข้าสู่ระบบ'),
    );
  }

  ElevatedButton btnGuest() {
    return ElevatedButton(
      onPressed: _guest,
      child: const Text('เข้าสู่ระบบแบบไม่ Login'),
    );
  }

  AlertDialog underConstruction() {
    return AlertDialog(
      content: const Text('ยังไม่รองรับตอนนี้ จะเข้าเป็นแบบ Guest นะ'),
      actions: <Widget>[
        TextButton(
          onPressed: () => _authen(),
          child: const Text('OK'),
        ),
      ],
    );
  }

  final String _buildInfo = """
POST https://api-nocode.beid.io/build_info
# Header
Accept-Charset: UTF-8
Accept-Encoding: zstd, br, gzip

# Body

# End
  """;
}
