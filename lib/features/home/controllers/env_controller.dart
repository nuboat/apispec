import 'package:apispec/core/data/env_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class EnvController extends GetxController {

  final envs = <String>[].obs;
  EnvModel envModel = EnvModel();

  void loadEnv() {
    envs.assignAll(f.listEnv().map((f) {
      return basename(f.path).replaceAll(".json", "");
    }).toList(),);
  }

  void buildEnvModel(String name) {
    envModel = EnvModel();
  }

  @override
  void onInit() {
    loadEnv();
    super.onInit();
  }

}

class EnvModel {
  final String raw = "";
}
