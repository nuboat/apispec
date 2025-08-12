import 'dart:collection';

import 'package:apispec/core/data/api_facade.dart' as f;
import "package:get/get.dart";
import 'package:path/path.dart';

class WorkspaceController extends GetxController {
  final folders = <String>[].obs;
  final apis = <String>[].obs;

  final Rx<String> activeEnv = "".obs;

  late final Rx<APIModel> activeAPI;
  late final RxString activeFolder;

  final Map<String, List<String>> _folderBuffer = HashMap();
  final Map<String, APIModel> _apiBuffer = HashMap();

  bool activeHasChange() {
    return activeAPI.value.hasChange();
  }

  String activeAPIName() {
    return activeAPI.value.name;
  }

  void changeFolder(String folder) {
    activeFolder.value = folder;
    if (_folderBuffer.containsKey(folder)) {
      apis.assignAll(_folderBuffer[folder]!);
    } else {
      _loadAPIs(folder);
    }
  }

  void changeAPI(String name) {

    // activeAPI.value = APIModel(
    //   name: name,
    //   requestRaw: f.readAPI(activeFolder.value, name, "request.rest"),
    //   responseRaw: f.readAPI(activeFolder.value, name, "response.text"),
    //   preRaw: f.readAPI(activeFolder.value, name, "pre.js"),
    //   postRaw: f.readAPI(activeFolder.value, name, "post.js"),
    //   specRaw: f.readAPI(activeFolder.value, name, "spec.js"),
    //   docRaw: f.readAPI(activeFolder.value, name, "doc.md"),
    //   configRaw: f.readAPI(activeFolder.value, name, "config.json"),
    // );
  }

  bool isActiveAPI(String name) {
    return activeAPI.value.name == name;
  }

  @override
  void onInit() {
    _loadFolders();
    activeFolder = folders.value.first.obs;

    _loadAPIs(activeFolder.value);

    final name = apis.first;
    activeAPI = APIModel(
      name: name,
      requestRaw: f.readAPI(activeFolder.value, name, "request.rest"),
      responseRaw: f.readAPI(activeFolder.value, name, "response.text"),
      preRaw: f.readAPI(activeFolder.value, name, "pre.js"),
      postRaw: f.readAPI(activeFolder.value, name, "post.js"),
      specRaw: f.readAPI(activeFolder.value, name, "spec.js"),
      docRaw: f.readAPI(activeFolder.value, name, "doc.md"),
      configRaw: f.readAPI(activeFolder.value, name, "config.json"),
    ).obs;
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

    _folderBuffer[folder] = list;
    apis.assignAll(list);
  }
}

class APIModel {
  final String name;
  final String requestRaw;
  final String responseRaw;
  final String preRaw;
  final String postRaw;
  final String specRaw;
  final String docRaw;
  final String configRaw;

  late final String requestProcess;
  late final String responseProcess;
  late final String preProcess;
  late final String postProcess;
  late final String specProcess;
  late final String docProcess;
  late final String configProcess;

  bool hasChange() {
    return (requestRaw != requestProcess
        || preRaw != preProcess
        || postRaw != postProcess
        || specRaw != specProcess
        || docRaw != docProcess
        || configRaw != configProcess
    );
  }

  APIModel({
    required this.name,
    required this.requestRaw,
    required this.responseRaw,
    required this.preRaw,
    required this.postRaw,
    required this.specRaw,
    required this.docRaw,
    required this.configRaw,
    String? requestProcess,
    String? responseProcess,
    String? preProcess,
    String? postProcess,
    String? specProcess,
    String? docProcess,
    String? configProcess,
  }) {
    this.requestProcess = requestRaw;
    this.responseProcess = responseRaw;
    this.preProcess = preRaw;
    this.postProcess = postRaw;
    this.specProcess = specRaw;
    this.docProcess = docRaw;
    this.configProcess = configRaw;
  }

  APIModel copy({
    String? name,
    String? requestRaw,
    String? responseRaw,
    String? preRaw,
    String? postRaw,
    String? specRaw,
    String? docRaw,
    String? configRaw,
    String? requestProcess,
    String? responseProcess,
    String? preProcess,
    String? postProcess,
    String? specProcess,
    String? docProcess,
    String? configProcess,
  }) {
    return APIModel(
      name: name ?? this.name,
      requestRaw: requestRaw ?? this.requestRaw,
      responseRaw: responseRaw ?? this.responseRaw,
      preRaw: preRaw ?? this.preRaw,
      postRaw: postRaw ?? this.postRaw,
      specRaw: specRaw ?? this.specRaw,
      docRaw: docRaw ?? this.docRaw,
      configRaw: configRaw ?? this.configRaw,
      requestProcess: requestProcess ?? this.requestProcess,
      responseProcess: responseProcess ?? this.responseProcess,
      preProcess: preProcess ?? this.preProcess,
      postProcess: postProcess ?? this.postProcess,
      specProcess: specProcess ?? this.specProcess,
      docProcess: docProcess ?? this.docProcess,
      configProcess: configProcess ?? this.configProcess,
    );
  }
}
