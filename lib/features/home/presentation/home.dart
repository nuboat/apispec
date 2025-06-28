import 'package:apispec/features/home/presentation/environment_screen.dart';
import 'package:apispec/features/home/presentation/setting_screen.dart';
import 'package:apispec/features/home/presentation/welcome_screen.dart';
import 'package:apispec/features/home/presentation/workspace_screen.dart';
import 'package:apispec/features/login/presentation/authen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.mode,
  });

  final String mode;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var activeScreen = "Welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 48,
            color: const Color(0xFF333333),
            child: Column(
              children: <Widget>[
                iconWelcome(),
                SizedBox(height: 16),
                iconWorkspace(),
                SizedBox(height: 16),
                iconEnvironment(),
                SizedBox(height: 16),
                const Spacer(),
                iconSetting(),
                SizedBox(height: 8),
                iconSignOut(),
                SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(child: Container(
            child: switch (activeScreen) {
              "Welcome" => WelcomeScreen(),
              "Workspace" => WorkspaceScreen(),
              "Environment" => EnvironmentScreen(),
              "Setting" => SettingScreen(),
              _ => WelcomeScreen(),
            },
          )),
        ],
      ),
    );
  }

  IconButton iconWelcome() {
    return IconButton(
      icon: const Icon(Icons.home, size: 32),
      color: Colors.teal,
      onPressed: () {
        setState(() {
          activeScreen = "Welcome";
        });
      },
    );
  }

  IconButton iconWorkspace() {
    return IconButton(
      icon: const Icon(Icons.workspaces, size: 32),
      color: Colors.teal,
      onPressed: () {
        setState(() {
          activeScreen = "Workspace";
        });
      },
    );
  }

  IconButton iconEnvironment() {
    return IconButton(
      icon: const Icon(Icons.data_object, size: 32),
      color: Colors.teal,
      onPressed: () {
        setState(() {
          activeScreen = "Environment";
        });
      },
    );
  }

  IconButton iconSetting() {
    return IconButton(
      icon: const Icon(Icons.settings, size: 24),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          activeScreen = "Setting";
        });
      },
    );
  }

  IconButton iconSignOut() {
    return IconButton(
      icon: const Icon(Icons.logout, size: 24),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          Get.to(() => Authen());
        });
      },
    );
  }
}
