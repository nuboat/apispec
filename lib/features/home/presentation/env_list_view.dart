import 'package:apispec/features/home/controllers/env_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvListView extends StatefulWidget {
  const EnvListView({super.key, required this.envCtrl});

  final EnvController envCtrl;

  @override
  State<EnvListView> createState() => _EnvListViewState();
}

class _EnvListViewState extends State<EnvListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: const Color(0xFF404040),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          header(),
          SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: widget.envCtrl.envs.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                  title: TextButton(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.envCtrl.envs.elementAt(index),
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    onPressed: () => widget.envCtrl.buildEnvModel(
                      widget.envCtrl.envs.elementAt(index),
                    ),
                  ),
                  dense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return SizedBox(
      height: 36,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          Text("Environments", style: TextStyle(fontSize: 16)),
          const Spacer(),
        ],
      ),
    );
  }
}
