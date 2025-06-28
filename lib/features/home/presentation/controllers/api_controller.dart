import "package:get/get.dart";

class APIController extends GetxController {

  late APIModel model;

  void loadAPISpec() {
    model = APIModel();
  }

  @override
  void onInit() {
    loadAPISpec();
    super.onInit();
  }

}

class APIModel {
  String request = "";
  String response = "";
}
