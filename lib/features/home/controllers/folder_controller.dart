import 'package:apispec/core/data/api_facade.dart' as f;
import 'package:get/get.dart';
import 'package:path/path.dart';

class FolderController extends GetxController {

  final apis = <String>[].obs;
  final folders = <String>[].obs;

  void loadAPI() {
    apis.assignAll(
      f.listAPI().map((f) {
        return basename(f.path).replaceAll(".rest", "");
      }).toList(),
    );
  }

  void loadFolder() {
    folders.assignAll(f.listFolder().map((f) {
      return basename(f.path);
    }).toList(),);
  }

  @override
  void onInit() {
    loadAPI();
    loadFolder();
    super.onInit();
  }

}
