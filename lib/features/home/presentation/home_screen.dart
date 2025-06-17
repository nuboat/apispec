import 'package:apispec/features/home/presentation/setting_screen.dart';
import 'package:apispec/features/home/presentation/welcome_screen.dart';
import 'package:apispec/features/home/presentation/workspace_screen.dart';
import 'package:flutter/material.dart';
import 'package:apispec/global.dart' as g;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                getIconWorkspace(),
                const Spacer(),
                getIconSetting(),
              ],
            ),
          ),
          Expanded(child: Container(
            child: switch (activeScreen) {
              "Workspace" => WorkspaceScreen(),
              "Setting" => SettingScreen(),
              _ => WelcomeScreen(),
            },
          )),
        ],
      ),
    );
  }

  IconButton getIconWorkspace() {
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

  IconButton getIconSetting() {
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
}
