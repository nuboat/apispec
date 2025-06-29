import 'package:get/get.dart';

class CollectionController extends GetxController {

  final collections = <String>[].obs;

  void loadCollections() {
    collections.assignAll(["No Env", "SIT", "UAT", "Production"]);
  }

  @override
  void onInit() {
    loadCollections();
    super.onInit();
  }

}
