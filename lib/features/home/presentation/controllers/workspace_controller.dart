import 'package:get/get.dart';

class WorkspaceController extends GetxController {

  final collections = <String>[].obs;

  void loadCollections() {
    collections.assignAll(["build_info", "signin"]);
  }

  @override
  void onInit() {
    loadCollections();
    super.onInit();
  }

}
