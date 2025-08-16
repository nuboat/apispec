import 'dart:io';

import 'package:apispec/core/common/date_facade.dart' as d;
import 'package:apispec/core/data/api_facade.dart' as a;
import 'package:apispec/core/data/base.dart' as b;
import 'package:apispec/define.dart' as d;
import 'package:apispec/features/home/presentation/home_screen.dart';
import 'package:apispec/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenScreen extends StatefulWidget {
  const AuthenScreen({super.key});

  @override
  State<AuthenScreen> createState() => _AuthenScreenState();
}

class _AuthenScreenState extends State<AuthenScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _authen() {
    Get.to(() => HomeScreen(mode: "1"));
  }

  void _guest() {
    b.homeDirectory().then( (path) {
      b.home = path;
      b.application = "Personal";
      b.folder = "default";

      if (!File("$path/initiated.txt").existsSync()) {
        final file = File("$path/initiated.txt");
        file.writeAsString("Initialed: ${d.nowInStr()}\n");
        file.writeAsStringSync("Version: 1.0", flush: true);

        Directory("${a.workPath()}/build_info")
            .createSync(recursive: true);
        File("${a.workPath()}/${d.request}")
            .writeAsStringSync(g.buildInfo, flush: true);
        File("${a.workPath()}/${d.response}")
            .writeAsStringSync("", flush: true);
        File("${a.workPath()}/${d.pre}")
            .writeAsStringSync("", flush: true);
        File("${a.workPath()}/${d.post}")
            .writeAsStringSync("", flush: true);
        File("${a.workPath()}/${d.spec}")
            .writeAsStringSync("", flush: true);
        File("${a.workPath()}/${d.doc}")
            .writeAsStringSync("", flush: true);
        File("${a.workPath()}/${d.config}")
            .writeAsStringSync("", flush: true);
      }
    });

    Get.to(() => HomeScreen(mode: "1")); // assume guest
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

}
