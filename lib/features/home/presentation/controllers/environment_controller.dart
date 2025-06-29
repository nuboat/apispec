import 'dart:async';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class EnvironmentController extends GetxController {

  late EnvModel model;
  final environments = <String>[].obs;

  void loadEnvironments() {
    environments.assignAll(["SIT", "UAT", "Production"]);
  }

  void loadEnvironment() {
    model = EnvModel();
  }

  @override
  void onInit() {
    _local().then( (value) { print(value); });

    loadEnvironment();
    super.onInit();
  }

  Future<String> _local() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

class EnvModel {
  String name = "";
  String data = "";
}
