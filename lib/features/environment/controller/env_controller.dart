import 'dart:collection';

import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {
  final envs = <String>[].obs;
  final Map<String, EnvModel> _buffer = HashMap();

  late final Rx<EnvModel> activeEnv;

  bool activeHasChange() {
    return activeEnv.value.hasChange();
  }

  String activeName() {
    return activeEnv.value.name;
  }

  void changeEnv(String name) {
    if (_buffer.containsKey(name)) {
      activeEnv.value = _buffer[name]!;
    } else {
      activeEnv.value = _loadEnv(name);
      _buffer[name] = activeEnv.value;
    }
  }

  void saveBuffer(String jsonProcess) {
    activeEnv.value = activeEnv.value.copy(jsonProcess: jsonProcess);
    _buffer[activeEnv.value.name] = activeEnv.value;
  }

  void createEnv(String name) {
    if (envs.where((f) => f == name).isNotEmpty) {
      return;
    }
    f.createFile(name);
    _loadEnvList();
  }

  void writeEnv(String jsonProcess) {
    try {
      f.writeDataToFile(activeEnv.value.name, jsonProcess);
      activeEnv.value = activeEnv.value.copy(
        jsonRaw: jsonProcess,
        jsonProcess: jsonProcess,
      );
      _buffer[activeEnv.value.name] = activeEnv.value;
    } catch (e) {
      print(e.toString());
    }
  }

  bool isActive(String name) {
    return activeEnv.value.name == name;
  }

  @override
  void onInit() {
    envs.assignAll(_loadEnvList());
    final activeEnvName = (f.hasEnv("default.json"))
        ? "default"
        : envs.value.elementAt(0);
    activeEnv = _loadEnv(activeEnvName).obs;
    _buffer[activeEnvName] = activeEnv.value;

    super.onInit();
  }

  List<String> _loadEnvList() {
    final list = f.listEnv().map((f) {
      return basename(f.path).replaceAll(".json", "");
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }

  EnvModel _loadEnv(String name) {
    return EnvModel(
        name: name,
        jsonRaw: f.readEnv(name)
    );
  }

}

class EnvModel {
  final String name;
  final String jsonRaw;
  late final String jsonProcess;

  bool hasChange() {
    return jsonRaw.trim() != jsonProcess.trim();
  }

  EnvModel({
    required this.name,
    required this.jsonRaw,
    String? jsonProcess,
  }) {
    this.jsonProcess = jsonRaw;
  }

  EnvModel copy({String? name, String? jsonRaw, String? jsonProcess}) {
    return EnvModel(
      name: name ?? this.name,
      jsonRaw: jsonRaw ?? this.jsonRaw,
      jsonProcess: jsonProcess ?? this.jsonProcess,
    );
  }
}
