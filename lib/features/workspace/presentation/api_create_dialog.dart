import 'package:apispec/features/workspace/controller/workspace_controller.dart';
import 'package:flutter/material.dart';
import 'package:apispec/core/data/api_facade.dart' as a;

class APICreateDialog extends StatefulWidget {
  const APICreateDialog({super.key, required this.workspaceCtrl});

  final WorkspaceController workspaceCtrl;

  @override
  State<APICreateDialog> createState() => _APICreateDialogState();
}

class _APICreateDialogState extends State<APICreateDialog> {

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Create New API"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Enter API name",
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
            if (_textController.text.isNotEmpty) {
              // TODO
              print("activeFolder: ${widget.workspaceCtrl.activeFolder}");
              final collectionName = widget.workspaceCtrl.activeFolder;
              final apiName = _textController.text;
              a.createAPI(collectionName.value, apiName);
              // widget.workspaceCtrl.loadFolders();
              // widget.workspaceCtrl.createEnv(_textController.text);
              // a.createAPI(collectionName, apiName)
              Navigator.of(context).pop();
              _textController.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("API name cannot be empty")),
              );
            }
          },
        ),
      ],
    );
  }

}
