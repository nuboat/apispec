library;

import 'dart:io';

import 'package:apispec/core/data/base.dart' as b;

String _folderPath() {
  return "${b.home}/applications/${b.application}/env/";
}

List<FileSystemEntity> listEnv() {
  return Directory(_folderPath()).listSync()
      .where((f) => f.path.toLowerCase().endsWith(".json")).toList();
}
