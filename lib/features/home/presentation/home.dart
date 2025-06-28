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
                iconWorkspace(),
                iconEnvironment(),
                const Spacer(),
                iconSetting(),
                iconSignOut(),
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
      icon: const Icon(Icons.home),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          activeScreen = "Welcome";
        });
      },
    );
  }

  IconButton iconWorkspace() {
    return IconButton(
      icon: const Icon(Icons.workspaces),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          activeScreen = "Workspace";
        });
      },
    );
  }

  IconButton iconEnvironment() {
    return IconButton(
      icon: const Icon(Icons.data_object),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          activeScreen = "Environment";
        });
      },
    );
  }

  IconButton iconSetting() {
    return IconButton(
      icon: const Icon(Icons.settings),
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
      icon: const Icon(Icons.logout),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          Get.to(() => Authen());
        });
      },
    );
  }
}
