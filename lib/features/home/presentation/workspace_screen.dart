import 'package:apispec/features/home/presentation/api_view.dart';
import 'package:apispec/features/home/presentation/collection_view.dart';
import 'package:apispec/features/home/presentation/controllers/workspace_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({super.key});

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkspaceController());
    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          CollectionView(
            collections: controller.collections,
            reload: controller.loadCollections,
          ),
          Expanded(child: APIView()),
        ],
      ),
    );
  }
}
