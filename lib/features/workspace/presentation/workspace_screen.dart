import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:apispec/features/workspace/controller/workspace_controller.dart';
import 'package:apispec/features/workspace/presentation/api_view.dart';
import 'package:apispec/features/workspace/presentation/directory_view.dart';
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
    final workspaceCtrl = Get.put(WorkspaceController());

    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          APIListView(workspaceCtrl: workspaceCtrl),
          Expanded(child: APIView(workspaceCtrl: workspaceCtrl, envCtrl: envCtrl)),
        ],
      ),
    );
  }
}
