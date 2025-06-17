import 'package:flutter/material.dart';
import 'package:apispec/core/presentation/line_text_field_screen.dart';

class LineTextField extends StatelessWidget {
  const LineTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VS Code-like Editor',
      theme: ThemeData.dark().copyWith( // Start with a dark theme like VS Code
        scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Dark VS Code background
        appBarTheme: const AppBarTheme(
          color: Color(0xFF252526), // Darker app bar
        ),
        textTheme: Typography.whiteCupertino.copyWith(
          bodyMedium: const TextStyle(
            fontFamily: 'MesloLGS NF', // Use a monospaced font
            color: Colors.white,
            fontSize: 13.0,
          ),
          // You might need to define other text styles as well
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none, // No default border for the TextField
          contentPadding: EdgeInsets.zero, // Remove default content padding
        ),
        // Further customize colors to match VS Code
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF007ACC), // VS Code blue for primary elements
          onPrimary: Colors.white,
          secondary: const Color(0xFF007ACC),
          onSecondary: Colors.white,
          surface: const Color(0xFF1E1E1E),
          onSurface: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
        ),
      ),
      home: const LineTextFieldScreen(),
    );
  }
}
