library;

import 'dart:io';

import 'package:apispec/core/data/base.dart' as b;

String _folderPath() {
  return "${b.home}/applications/${b.application}/api/";
}

bool hasFolder(String name) {
  return File('${_folderPath()}default').existsSync();
}

bool hasAPI(String folder, String name) {
  return File('${_folderPath()}$folder/$name/api.rest').existsSync();
}

String readAPI(String folder, String name) {
  return File('${_folderPath()}$folder/$name/api.rest').readAsStringSync();
}

String readResult(String folder, String name) {
  return File('${_folderPath()}$folder/$name/api.result').readAsStringSync();
}

File readResponse(String name) {
  return File('${_folderPath()}$name.rest');
}

String workPath() {
  final path = "${_folderPath()}/${b.folder}/";
  print("workPath: $path");
  return path;
}

List<FileSystemEntity> listFolder() {
  return Directory(_folderPath()).listSync();
}

List<FileSystemEntity> listAPI(String folder) {
  return Directory('${_folderPath()}$folder').listSync();
}
