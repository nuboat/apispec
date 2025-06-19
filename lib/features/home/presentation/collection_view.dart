import 'package:flutter/material.dart';

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
  void _refresh() {
    widget.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: const Color(0xFF444444),
      child: Column(
        children: <Widget>[
          menu(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.collections.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.collections.elementAt(index),
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
    return Row(
      children: <Widget>[
        Text(" "),
        Expanded(child: Text("Collections")),
        const Spacer(),
        SizedBox(
          height: 36,
          child: IconButton(
            icon: Icon(Icons.refresh, size: 24),
            onPressed: _refresh,
          ),
        ),
      ],
    );
  }
}
