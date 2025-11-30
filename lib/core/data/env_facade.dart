library;

import 'dart:io';

import 'package:apispec/core/context.dart' as b;

String _folderPath() {
  return "${b.home}/applications/${b.application}/env";
}

void _ensureDirectoryExists() {
  final dir = Directory(_folderPath());
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    createFile("default");
  }
}

bool hasEnv(String name) {
  return loadFile(name).existsSync();
}

String readEnv(String name) {
  return loadFile(name).readAsStringSync();
}

File loadFile(String name) {
  return File('${_folderPath()}/$name.json');
}

void createFile(String name) {
  final file = loadFile(name);
  try {
    file.writeAsStringSync("""
{
}""", flush: true);
  } catch (e) {
    throw Exception('Failed to create file: $e'); // Re-throw or handle
  }
}

Future<File> writeDataToFile(String name, String data) async {
  final file = loadFile(name);
  try {
    return await file.writeAsString(data);
  } catch (e) {
    throw Exception('Failed to write file: $e'); // Re-throw or handle
  }
}

List<FileSystemEntity> listEnv() {
  _ensureDirectoryExists();
  return Directory(_folderPath()).listSync().where((f) => f.path.toLowerCase().endsWith(".json")).toList();
}
