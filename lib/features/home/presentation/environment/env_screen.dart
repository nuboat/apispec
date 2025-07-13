import 'package:apispec/features/home/controllers/env_controller.dart';
import 'package:apispec/features/home/presentation/environment/env_edit_view.dart';
import 'package:apispec/features/home/presentation/environment/env_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvScreen extends StatefulWidget {
  const EnvScreen({super.key});

  @override
  State<EnvScreen> createState() => _EnvScreenState();
}

class _EnvScreenState extends State<EnvScreen> {
  @override
  Widget build(BuildContext context) {
    final envCtrl = Get.put(EnvController());

    return SizedBox(
      width: 208,
      child: Row(
        children: <Widget>[
          EnvListView(envCtrl: envCtrl),
          Expanded(child: EnvEditView(envCtrl: envCtrl)),
        ],
      ),
    );
  }
}
