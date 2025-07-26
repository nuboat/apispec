import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {

  String _activeEnv = "";
  final envs = <String>[].obs;
  final Rx<EnvModel> envModel = Rx<EnvModel>(EnvModel(rawJson: ""));

  void loadEnvNames() {
    final list = f.listEnv().map((f) {
      return basename(f.path).replaceAll(".json", "");
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    envs.assignAll(list);
  }

  void buildEnvModel(String name) {
    _activeEnv = name;
    envModel.value = EnvModel(rawJson: "{}");
  }

  bool isActive(String name) {
    return _activeEnv == name;
  }

  @override
  void onInit() {
    loadEnvNames();
    super.onInit();
  }
}

class EnvModel {
  final String rawJson;

  EnvModel({required this.rawJson});
}
