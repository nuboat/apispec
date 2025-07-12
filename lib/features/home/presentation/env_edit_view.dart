import 'package:apispec/global.dart' as g;
import 'package:flutter/material.dart';

class EnvEditView extends StatefulWidget {
  const EnvEditView({super.key
    , required this.raw
    , required this.reload});

  final String raw;

  final Function reload;

  @override
  State<EnvEditView> createState() => _EnvEditViewState();
}

class _EnvEditViewState extends State<EnvEditView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF666666),
      child: Column(
        children: <Widget>[
          actionBar(),
          Expanded(
            child: editText()
          ),
        ],
      ),
    );
  }

  Widget actionBar() {
    return Container(
      height: 35,
      color: const Color(0xFF000000),
      child: Row(
        children: [
          // Add action Here
        ],
      ),
    );
  }

  Widget editText() {
    return TextField(
      maxLines: null,
      expands: true,
      style: const TextStyle(
        fontFamily: g.mainFont,
        color: Colors.white,
        fontSize: 13,
      ),
      decoration: const InputDecoration(border: InputBorder.none),
      controller: TextEditingController(text: widget.raw),
    );
  }
}
