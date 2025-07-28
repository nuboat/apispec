import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:flutter/material.dart';

class EnvCreateDialog extends StatefulWidget {
  const EnvCreateDialog({super.key, required this.envCtrl});

  final EnvController envCtrl;

  @override
  State<EnvCreateDialog> createState() => _EnvCreateDialogState();
}

class _EnvCreateDialogState extends State<EnvCreateDialog> {

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Create New Environment"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Enter environment name",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
            _textController.clear();
          },
        ),
        ElevatedButton(
          child: Text("Create"),
          onPressed: () {
            String environmentName = _textController.text;
            if (environmentName.isNotEmpty) {
              widget.envCtrl.createEnv(_textController.text);
              Navigator.of(context).pop();
              _textController.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Environment name cannot be empty")),
              );
            }
          },
        ),
      ],
    );
  }

}
