library;

import 'dart:io';

import 'package:apispec/core/data/base.dart' as b;

String _folderPath() {
  return "${b.home}/applications/${b.application}/api/";
}

String workPath() {
  return  "${_folderPath()}/${b.folder}/";
}

List<FileSystemEntity> listFolder() {
  return Directory(_folderPath()).listSync();
}

List<FileSystemEntity> listAPI() {
  return Directory(_folderPath() + b.folder).listSync()
      .where((f) => f.path.toLowerCase().endsWith(".rest")).toList();
}
