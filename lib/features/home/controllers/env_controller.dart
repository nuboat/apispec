import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {
  final envs = <String>[].obs;
  final Rx<EnvModel> envModel = Rx<EnvModel>(EnvModel(rawJson: ""));

  void loadEnvNames() {
    envs.assignAll(
      f.listEnv().map((f) {
        return basename(f.path).replaceAll(".json", "");
      }).toList(),
    );
  }

  void buildEnvModel(String name) {
    envModel.value = EnvModel(rawJson: "{}");
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
