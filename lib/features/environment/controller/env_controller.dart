import 'dart:collection';

import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {

  final envs = <String>[].obs;

  late final RxString activeEnv;
  late final Rx<EnvModel> envModel;

  final Map<String, EnvModel> buffer = HashMap();

  @override
  void onInit() {
    loadEnvList();
    activeEnv = ((f.hasEnv("default.json")) ? "default" : envs.value.elementAt(0)).obs;

    final data = f.readEnv(activeEnv.value);
    envModel = EnvModel(rawJson: f.readEnv(activeEnv.value), processJson: data).obs;
    buffer[activeEnv.value] = envModel.value;

    super.onInit();
  }

  void loadEnvList() {
    final list = f.listEnv().map((f) {
      return basename(f.path).replaceAll(".json", "");
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    envs.assignAll(list);
  }

  void loadEnvModel(String name) {
    activeEnv.value = name;

    envModel.value = buffer.putIfAbsent(name, () => EnvModel(rawJson: "", processJson: ""));
  }

  void saveBuffer(String data) {
    envModel.value = EnvModel(rawJson: envModel.value.rawJson, processJson: data);
    buffer[activeEnv.value] = envModel.value;
  }

  void createEnv(String name) {
    if (envs.where((f) => f == name).isNotEmpty) {
      return;
    }
    f.createFile(name);
    loadEnvList();
  }

  void writeEnv(String data) {
    try {
      f.writeDataToFile(activeEnv.value, data);
      envModel.value = EnvModel(rawJson: data, processJson: data);
      buffer[activeEnv.value] = envModel.value;
    } catch (e) {
      print(e.toString());
    }
  }

  bool isActive(String name) {
    return activeEnv.value == name;
  }

}

class EnvModel {
  final String rawJson;
  final String processJson;

  EnvModel({required this.rawJson, required this.processJson});

  bool hasChange() {
    return rawJson.trim() != processJson.trim();
  }
}
