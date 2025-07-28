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
  final RxBool _hasChanged = false.obs;
  late final TextEditingController _editor;

  void _remove() {

  }

  void _save() {
    if (!_hasChanged.value) {
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
  }

  @override
  void initState() {
    super.initState();
    _editor = TextEditingController();
    _editor.addListener(_onEditorTextChanged);
  }

  @override
  void dispose() {
    _editor.removeListener(_onEditorTextChanged);
    _editor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF666666),
      child: Column(
        children: <Widget>[
          actionBar(),
          Obx(() {
            final String controllerJson = widget.envCtrl.envModel.value.rawJson;
            if (_editor.text != controllerJson) {
              _editor.removeListener(_onEditorTextChanged);
              _editor.text = controllerJson;
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
      child: Row(children: [
        btnSave(),
        const Spacer(),
        btnDelete(),
      ]),
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
                child: Obx(
                  () => Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      (_hasChanged.value) ? "Save **" : "Save",
                      style: TextStyle(
                        color: (_hasChanged.value)
                            ? Colors.redAccent
                            : Colors.white,
                        fontSize: 13,
                      ),
                    ),
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

  void _onEditorTextChanged() {
    _hasChanged.value =
        _editor.text.trim() != widget.envCtrl.envModel.value.rawJson.trim();
  }
}
