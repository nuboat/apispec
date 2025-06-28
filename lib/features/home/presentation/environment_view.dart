import 'package:flutter/material.dart';

class EnvironmentView extends StatefulWidget {
  const EnvironmentView({
    super.key,
    required this.environments,
    required this.reload,
  });

  final List<String> environments;

  final Function reload;

  @override
  State<EnvironmentView> createState() => _EnvironmentViewState();
}

class _EnvironmentViewState extends State<EnvironmentView> {
  void _refresh() {
    widget.reload();
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
              itemCount: widget.environments.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.environments.elementAt(index),
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
    return SizedBox(
      height: 36,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          Text("Environments", style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(icon: Icon(Icons.refresh, size: 24), onPressed: _refresh),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
