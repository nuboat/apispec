import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:apispec/features/workspace/controller/folder_controller.dart';
import 'package:apispec/features/workspace/presentation/api_exec_view.dart';
import 'package:apispec/features/workspace/presentation/api_list_view.dart';
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

    final envCtrl = Get.put(EnvController());
    final folderCtrl = Get.put(FolderController());

    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          APIListView(folderCtrl: folderCtrl),
          Expanded(child: APIView(envs: envCtrl.envs)),
        ],
      ),
    );
  }
}
