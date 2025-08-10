import 'package:apispec/core/data/api_facade.dart' as f;
import "package:get/get.dart";
import 'package:path/path.dart';

class WorkspaceController extends GetxController {

  final apis = <String>[].obs;
  final folders = <String>[].obs;

  late final Rx<APIModel> apiModel;
  late final RxString activeFolder;

  late final RxString activeAPI = "".obs;

  @override
  void onInit() {
    loadFolders();
    activeFolder = ((f.hasFolder("default")) ? "default" : folders.value.first).obs;

    loadAPIs(activeFolder.value);

    apiModel = APIModel(
        request: f.readAPI(activeFolder.value, activeAPI.value)
            , response: f.readAPI(activeFolder.value, activeAPI.value)
    ).obs;
    super.onInit();
  }

  void loadFolders() {
    final list = f.listFolder().map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    folders.assignAll(list);
  }

  void loadAPIs(String folder) {
    activeFolder.value = folder;
    final list = f.listAPI(folder).map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    apis.assignAll(list);
    activeAPI.value = (apis.value.isNotEmpty) ? apis.value.elementAt(0) : "";
  }

  void changeAPI(String name) {
    activeAPI.value = name;
    apiModel.value = APIModel(
        request: f.readAPI(activeFolder.value, activeAPI.value)
        , response: f.readAPI(activeFolder.value, activeAPI.value));
  }

  bool isActiveAPI(String name) {
    return activeAPI.value == name;
  }

}

class APIModel {
  final String request;
  final String response;

  APIModel({required this.request, required this.response});
}
