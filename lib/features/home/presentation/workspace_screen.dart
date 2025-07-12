import 'package:apispec/features/home/controllers/env_controller.dart';
import 'package:apispec/features/home/controllers/folder_controller.dart';
import 'package:apispec/features/home/presentation/api_view.dart';
import 'package:apispec/features/home/presentation/folder_view.dart';
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
    final folderCtrl = Get.put(FolderController());
    final envCtrl = Get.put(EnvController());

    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          FolderView(
            listAPI: folderCtrl.apis,
            loadAPI: folderCtrl.loadAPI,
            listFolder: folderCtrl.folders,
            loadFolder: folderCtrl.loadFolder,
          ),
          Expanded(child: APIView(
            envs: envCtrl.envs,
          )),
        ],
      ),
    );
  }
}
