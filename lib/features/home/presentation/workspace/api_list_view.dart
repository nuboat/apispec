import 'package:apispec/features/home/controllers/folder_controller.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: const Color(0xFF404040),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          menu(),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: widget.folderCtrl.apis.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.folderCtrl.folders.elementAt(index),
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  onPressed: () => "",
                ),
                dense: true,
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
          SizedBox(width: 16),
          DropdownButton<String>(
            value: dropdownValue,
            style: const TextStyle(color: Colors.redAccent),
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
          IconButton(
            icon: Icon(Icons.create_new_folder, size: 24),
            onPressed: _newDirectory,
          ),
          IconButton(icon: Icon(Icons.post_add, size: 24), onPressed: _newAPI),
        ],
      ),
    );
  }
}
