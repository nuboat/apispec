import 'package:apispec/features/workspace/controller/workspace_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APIListView extends StatefulWidget {
  const APIListView({super.key, required this.workspaceCtrl});

  final WorkspaceController workspaceCtrl;

  @override
  State<APIListView> createState() => _APIListViewState();
}

class _APIListViewState extends State<APIListView> {

  void _newDirectory() {
    //
  }

  void _newAPI() {
    //
  }

  void _changeFolder(String name) {
    widget.workspaceCtrl.loadAPIs(name);
    setState(() {});
  }

  void _changeAPI(String apiName) {
    widget.workspaceCtrl.changeAPI(apiName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: const Color(0xFF404040),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          menu(),
          SizedBox(height: 16),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: widget.workspaceCtrl.apis.length,
                itemBuilder: (context, index) {
                  final apiName = widget.workspaceCtrl.apis.elementAt(index);
                  final isSelected = widget.workspaceCtrl.isActiveAPI(apiName);

                  return ListTile(
                    leading: Icon(
                      Icons.http,
                      color: isSelected ? Colors.blue : Colors.white,
                      size: 32,
                    ),
                    title: TextButton(
                      onPressed: isSelected ? null : () => _changeAPI(apiName),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          apiName,
                          style: isSelected
                              ? TextStyle(color: Colors.green, fontSize: 16)
                              : TextStyle(color: Colors.white, fontSize: 16),
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

  Widget menu() {
    return SizedBox(
      height: 36,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.create_new_folder, size: 24),
            onPressed: _newDirectory,
          ),
          SizedBox(width: 8),
          DropdownButton<String>(
            value: widget.workspaceCtrl.activeFolder.value,
            style: const TextStyle(color: Colors.green, fontSize: 16),
            underline: Container(height: 0),
            onChanged: (String? value) {
              _changeFolder(value!);
            },
            items: widget.workspaceCtrl.folders.map<DropdownMenuItem<String>>((
              String value,
            ) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          const Spacer(),
          IconButton(icon: Icon(Icons.post_add, size: 24), onPressed: _newAPI),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
