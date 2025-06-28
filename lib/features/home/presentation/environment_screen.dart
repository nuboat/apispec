import 'package:apispec/features/home/presentation/controllers/environment_controller.dart';
import 'package:apispec/features/home/presentation/environment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {

  @override
  Widget build(BuildContext context) {
    final envController = Get.put(EnvironmentController());

    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          EnvironmentView(
            environments: envController.environments,
            reload: envController.loadEnvironments,
          ),
          // Expanded(child: APIView(
          //   environments: apiController.collections,
          //   reload: apiController.loadCollections,
          // )),
        ],
      ),
    );
  }

}
