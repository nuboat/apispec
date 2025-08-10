import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:apispec/features/environment/presentation/env_create_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvListView extends StatefulWidget {
  const EnvListView({super.key, required this.envCtrl});

  final EnvController envCtrl;

  @override
  State<EnvListView> createState() => _EnvListViewState();
}

class _EnvListViewState extends State<EnvListView> {

  void _changeFile(String name) {

    widget.envCtrl.loadEnvModel(name);

    setState(() {

    });
  }

  void _createENV() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EnvCreateDialog(envCtrl: widget.envCtrl,);
      },
    );
  }

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
                itemBuilder: (context, index) {
                  final env = widget.envCtrl.envs.elementAt(index);
                  final isSelected = widget.envCtrl.isActive(env);
                  // print("$env: $isSelected");

                  return ListTile(
                    leading: Icon(
                      Icons.edit_note,
                      color: Colors.blue,
                      size: 24,
                    ),
                    title: TextButton(
                      onPressed: isSelected ? null : () => _changeFile(env),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          env,
                          style: isSelected ? TextStyle(color: Colors.green, fontSize: 16) : TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    dense: true,
                    tileColor: isSelected ? Colors.grey : null,
                  );
                },
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
          IconButton(icon: Icon(Icons.post_add, size: 24), onPressed: _createENV),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
