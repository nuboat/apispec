import 'package:apispec/features/login/presentation/authen_screen.dart';
import 'package:apispec/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APISpecApp extends StatelessWidget {
  const APISpecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Spec',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF252526),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        fontFamily: g.mainFont,
        hintColor: Colors.grey[600],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007ACC),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF3C3C3C),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
      home: const AuthenScreen(),
    );
  }
}
