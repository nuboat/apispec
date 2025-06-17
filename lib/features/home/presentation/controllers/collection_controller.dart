import 'package:get/get.dart';

class CollectionController extends GetxController {

  late APIModel model;

  loadAPISpec() {
    model = new APIModel();
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
