import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {

  late final Rx<EnvModel> envModel;

  final envs = <String>[].obs;
  final RxString activeEnv = RxString("");

  void loadEnvLists() {
    final list = f.listEnv().map((f) {
      return basename(f.path).replaceAll(".json", "");
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    envs.assignAll(list);
  }

  void loadEnvModel(String name) {
    activeEnv.value = name;
    envModel.value = EnvModel(rawJson: f.readEnv(activeEnv.value));
  }

  void writeEnv(String data) {
    try {
      f.writeDataToFile(activeEnv.value, data.trim());
    } catch (e) {
      print(e.toString());
    }
  }

  bool isActive(String name) {
    return activeEnv.value == name;
  }

  @override
  void onInit() {
    loadEnvLists();
    activeEnv.value = (f.hasEnv("default.json")) ? "default" : envs.value.elementAt(0);
    envModel = EnvModel(rawJson: f.readEnv(activeEnv.value)).obs;
    super.onInit();
  }
}

class EnvModel {
  final String rawJson;

  EnvModel({required this.rawJson});
}
