library;

import 'dart:async';

import 'package:path_provider/path_provider.dart';

String home = "";
String application = "";
String folder = "default";

Future<String> homeDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
