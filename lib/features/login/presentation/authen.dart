import 'dart:io';

import 'package:apispec/core/common/date_facade.dart' as d;
import 'package:apispec/core/data/collection_facade.dart' as c;
import 'package:apispec/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    c.homeDirectory().then( (path) {
      c.home = path;
      c.application = "Personal";
      c.collection = "default";

      if (!File('$path/initiated.txt').existsSync()) {
        File('$path/initiated.txt')
            .writeAsStringSync("Initialed: ${d.nowInStr()}\n", flush: true);
        Directory(c.workPath())
            .createSync(recursive: true);
        File('${c.workPath()}/build_info.rest')
            .writeAsStringSync(_buildInfo, flush: true);
      }
    });

    Get.to(() => Home(mode: "1")); // assume guest
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
