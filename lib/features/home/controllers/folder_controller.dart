import 'package:apispec/core/data/api_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class FolderController extends GetxController {
  final apis = <String>[].obs;
  final folders = <String>[].obs;

  String _activeFile = "";
  String _activeFolder = "default";

  void loadAPI(String folderName) {
    final list = f.listAPI().map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    apis.assignAll(list);
  }

  void loadFolders() {
    final list = f.listFolder().map((f) {
      return basename(f.path);
    }).toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    folders.assignAll(list);
  }

  bool isActiveFile(String name) {
    return _activeFile == name;
  }

  void switchFolder(String name) {
    _activeFolder = name;
    // TODO
  }

  void switchFile(String fileName) {
    _activeFile = fileName;
    // TODO
  }

  @override
  void onInit() {
    loadFolders();
    loadAPI(_activeFolder);
    super.onInit();
  }
}
