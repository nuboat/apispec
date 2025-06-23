import "package:get/get.dart";

class APIController extends GetxController {

  final collections = <String>[].obs;

  void loadCollections() {
    print("Yo!");
    collections.assignAll(["No Env", "SIT", "UAT", "Production"]);
  }

  @override
  void onInit() {
    loadCollections();
    super.onInit();
  }

}
