import 'package:flutter/material.dart';
import 'package:apispec/global.dart' as g;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      child: Row(children: <Widget>[Expanded(child: Text("  Welcome"))]),
    );
  }
}
