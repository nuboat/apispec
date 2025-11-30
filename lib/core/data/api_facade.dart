library;

import 'dart:io';

import 'package:apispec/core/context.dart' as b;
import 'package:apispec/define.dart' as d;
import 'package:apispec/global.dart' as g;

String _folderPath() {
  return "${b.home}/applications/${b.application}/api/";
}

bool hasFolder(String name) {
  return File('${_folderPath()}default').existsSync();
}

bool hasAPI(String folder, String name) {
  return File('${_folderPath()}$folder/$name/request.rest').existsSync();
}

String readAPI(String folder, String name, String part) {
  try {
    return File('${_folderPath()}$folder/$name/$part').readAsStringSync();
  } catch (e) {
    return "";
  }

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

void createCollection(String name) {
  final dir = Directory('${_folderPath()}$name');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
}

void createAPI(String collectionName, String apiName) {
  final dir = Directory('${_folderPath()}$collectionName/$apiName');
  print("createAPI: ${dir.path}");
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    File("${dir.path}/${d.request}")
        .writeAsStringSync(g.sampleRequest, flush: true);
    File("${dir.path}/${d.response}")
        .writeAsStringSync("", flush: true);
    File("${dir.path}/${d.pre}")
        .writeAsStringSync("", flush: true);
    File("${dir.path}/${d.post}")
        .writeAsStringSync("", flush: true);
    File("${dir.path}/${d.spec}")
        .writeAsStringSync("", flush: true);
    File("${dir.path}/${d.doc}")
        .writeAsStringSync("", flush: true);
    File("${dir.path}/${d.config}")
        .writeAsStringSync("", flush: true);
  }
}
