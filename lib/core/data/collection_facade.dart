library;

import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

String home = "";
String application = "";
String collection = "";

Future<String> homeDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

String workPath() {
  return "$home/applications/$application/collections/$collection/";
}

String collectionPath() {
  return "$home/applications/$application/collections/";
}

List<FileSystemEntity> listCollection() {
  return Directory(collectionPath()).listSync();
}

List<FileSystemEntity> listAPI() {
  return Directory(workPath()).listSync()
      .where((f) => f.path.toLowerCase().endsWith(".rest")).toList();
}
