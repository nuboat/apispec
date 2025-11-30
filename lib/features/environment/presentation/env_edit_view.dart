import 'dart:convert';

import 'package:apispec/core/common/json_facade.dart' as j;
import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:apispec/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvEditView extends StatefulWidget {
  const EnvEditView({super.key, required this.envCtrl});

  final EnvController envCtrl;

  @override
  State<EnvEditView> createState() => _EnvEditViewState();
}

class _EnvEditViewState extends State<EnvEditView> {
  late final TextEditingController _editor;
  late String _activeEnv;

  void _remove() {}

  void _save() {
    if (!widget.envCtrl.activeHasChange()) {
      return;
    }
    try {
      final node = json.decode(_editor.text);
      _editor.text = j.prettyPrintJson(node);
      widget.envCtrl.writeEnv(_editor.text);
    } on FormatException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Malformed Json, ${e.message}")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("System Error: ${e.toString()}")));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF666666),
      child: Column(
        children: <Widget>[
          actionBar(),
          Obx(() {
            if (_activeEnv != widget.envCtrl.activeEnv.value.name) {
              _editor.removeListener(_onEditorTextChanged);
              _activeEnv = widget.envCtrl.activeEnv.value.name;
              _editor.text = widget.envCtrl.activeEnv.value.jsonProcess;
              _editor.addListener(_onEditorTextChanged);
            }

            return Expanded(child: editText());
          }),
        ],
      ),
    );
  }

  Widget actionBar() {
    return Container(
      height: 35,
      color: const Color(0xFF000000),
      child: Row(children: [btnSave(), const Spacer(), btnDelete()]),
    );
  }

  Widget btnSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      color: const Color(0xFF1E1E1E),
      child: Center(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.blue, size: 24),
              onPressed: _save,
            ),
            TextButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  (widget.envCtrl.activeHasChange()) ? "Save **" : "Save",
                  style: TextStyle(
                    color: (widget.envCtrl.activeHasChange())
                        ? Colors.redAccent
                        : Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              onPressed: () => _save(),
            ),
          ],
        ),
      ),
    );
  }

  Widget btnDelete() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      color: const Color(0xFF1E1E1E),
      child: Center(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent, size: 24),
              onPressed: _remove,
            ),
          ],
        ),
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
      controller: _editor,
    );
  }

  @override
  void initState() {
    super.initState();
    print("_editor initial");
    _activeEnv = widget.envCtrl.activeEnv.value.name;
    _editor = TextEditingController();
    _editor.text = widget.envCtrl.activeEnv.value.jsonProcess;
    _editor.addListener(_onEditorTextChanged);
  }

  @override
  void dispose() {
    _editor.removeListener(_onEditorTextChanged);
    _editor.dispose();
    super.dispose();
  }

  void _onEditorTextChanged() {
    if (_editor.text != widget.envCtrl.activeEnv.value.jsonProcess) {
      widget.envCtrl.saveBuffer(_editor.text);
    }
    setState(() {});
  }
}
