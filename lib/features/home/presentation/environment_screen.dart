import 'package:flutter/material.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      child: Row(children: <Widget>[Expanded(child: Text("  Environment"))]),
    );
  }
}
