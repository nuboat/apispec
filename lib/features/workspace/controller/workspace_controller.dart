import 'dart:collection';

import 'package:apispec/core/data/api_facade.dart' as f;
import 'package:apispec/define.dart' as d;
import 'package:apispec/features/workspace/controller/api_model.dart';
import "package:get/get.dart";
import 'package:path/path.dart';
import 'package:apispec/core/data/api_facade.dart' as a;

class WorkspaceController extends GetxController {
  final apis = <String>[].obs;
  final Map<String, APIModel> _apiBuffer = HashMap();

  final folders = <String>[].obs;
  final Map<String, List<String>> _folderBuffer = HashMap();

  late final RxString activeFolder;
  late final Rx<APIModel> activeAPI;

  late final RxString activeEnv;

  void changeFolder(String folder) {
    activeFolder.value = folder;
    if (_folderBuffer.containsKey(folder)) {
      apis.assignAll(_folderBuffer[folder]!);
    } else {
      _loadAPIs(folder);
    }
  }

  void saveAPIBuffer(String requestProcess) {
    activeAPI.value = activeAPI.value.copy(requestProcess: requestProcess);
    _apiBuffer[activeAPI.value.name] = activeAPI.value;
  }

  void changeAPI(String api) {
    activeAPI.value = _loadAPI(activeFolder.value, api);
  }

  void changeEnv(String env) {
    activeEnv.value = env;
  }

  bool isActiveAPI(String name) {
    return activeAPI.value.name == name;
  }

  void createAPI(String apiName) {
    a.createAPI(activeFolder.value, apiName);
    _loadAPIs(activeFolder.value);
    changeAPI(apiName);
  }

  @override
  void onInit() {
    activeEnv = "default".obs;

    _loadFolders();
    activeFolder = folders.value.first.obs;

    _loadAPIs(activeFolder.value);

    activeAPI = _loadAPI(activeFolder.value, apis.first).obs;

    super.onInit();
  }

  void _loadFolders() {
    final list = f.listFolder().map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    folders.assignAll(list);
  }

  void _loadAPIs(String folder) {
    final list = f.listAPI(folder).map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    apis.assignAll(list);
    _folderBuffer[folder] = list;
  }

  APIModel _loadAPI(String folder, String api) {
    final activeAPI = APIModel(
      name: api,
      requestRaw: f.readAPI(folder, api, d.request),
      responseRaw: f.readAPI(folder, api, d.response),
      preRaw: f.readAPI(folder, api, d.pre),
      postRaw: f.readAPI(folder, api, d.post),
      specRaw: f.readAPI(folder, api, d.spec),
      docRaw: f.readAPI(folder, api, d.doc),
      configRaw: f.readAPI(folder, api, d.config),
    );
    _apiBuffer["${folder}_$api"] = activeAPI;
    return activeAPI;
  }
}
