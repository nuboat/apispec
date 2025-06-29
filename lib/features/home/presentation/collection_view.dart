import 'package:apispec/core/data/collection_facade.dart' as f;
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({
    super.key,
    required this.collections,
    required this.reload,
  });

  final List<String> collections;

  final Function reload;

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {

  void _newAPI() {
    //
  }

  @override
  Widget build(BuildContext context) {
    final list = f.listAPI().map( (f) {
      return basename(f.path).replaceAll(".rest", "");
    }).toList();

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
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      list.elementAt(index),
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
    String dropdownValue = "default";
    final list = f.listCollection().map( (f) {
      return basename(f.path);
    }).toList();

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
            items: list.map<DropdownMenuItem<String>>((
              String value,
            ) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          const Spacer(),
          IconButton(icon: Icon(Icons.add, size: 24), onPressed: _newAPI),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
