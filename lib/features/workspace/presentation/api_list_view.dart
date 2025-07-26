import 'package:apispec/features/workspace/controller/folder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APIListView extends StatefulWidget {
  const APIListView({super.key, required this.folderCtrl});

  final FolderController folderCtrl;

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

  void _activeAPI(String apiName) {
    setState(() {
      // refresh screen;
    });
    widget.folderCtrl.switchFile(apiName);
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
                itemCount: widget.folderCtrl.apis.length,
                itemBuilder: (context, index) {
                  final apiName = widget.folderCtrl.apis.elementAt(index);
                  final isSelected = widget.folderCtrl.isActiveFile(apiName);

                  return ListTile(
                    leading: Icon(
                      Icons.http,
                      color: isSelected ? Colors.blue : Colors.white,
                      size: 32,
                    ),
                    title: TextButton(
                      onPressed: isSelected ? null : () => _activeAPI(apiName),
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
    var dropdownValue = 'default';

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
            value: dropdownValue,
            style: const TextStyle(color: Colors.green, fontSize: 16),
            underline: Container(height: 0),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: widget.folderCtrl.folders.map<DropdownMenuItem<String>>((
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
