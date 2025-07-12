import 'package:flutter/material.dart';

class EnvView extends StatefulWidget {
  const EnvView({
    super.key,
    required this.envs,
    required this.reload,
  });

  final List<String> envs;

  final Function reload;

  @override
  State<EnvView> createState() => _EnvViewState();
}

class _EnvViewState extends State<EnvView> {

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
          header(),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: widget.envs.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.edit_note, color: Colors.blue, size: 24),
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.envs.elementAt(index),
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
