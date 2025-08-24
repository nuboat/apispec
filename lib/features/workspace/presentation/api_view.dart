import 'package:apispec/features/environment/controller/env_controller.dart';
import 'package:apispec/features/workspace/controller/workspace_controller.dart';
import 'package:apispec/global.dart' as g;
import 'package:flutter/material.dart';

class APIView extends StatefulWidget {
  const APIView({super.key, required this.workspaceCtrl, required this.envCtrl});

  final EnvController envCtrl;
  final WorkspaceController workspaceCtrl;

  @override
  State<APIView> createState() => _APIViewState();
}

class _APIViewState extends State<APIView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF666666),
      child: Column(
        children: <Widget>[
          actionBar(),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: tabBarAPI()),
                responsePreview(),
              ],
            ),
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
          btnSend(),
          const Spacer(),
          switchEditMode(),
          SizedBox(width: 16),
          dropdownEnvironment(),
          SizedBox(width: 16),
          dropdownExport(),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget tabBarAPI() {
    return DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const TabBar(
              dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.wysiwyg)),
                Tab(icon: Icon(Icons.navigate_before)),
                Tab(icon: Icon(Icons.navigate_next)),
                Tab(icon: Icon(Icons.bug_report)),
                Tab(icon: Icon(Icons.article)),
                Tab(icon: Icon(Icons.settings_applications)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              textEditAPI(),
              textEditPreProcess(),
              textEditPostProcess(),
              textEditSpec(),
              markdownDocument(),
              settingAPI(),
            ],
          ),
        ),
      );
  }

  Widget responsePreview() {
    return Container(
      width: MediaQuery.sizeOf(context).width / 4,
      padding: const EdgeInsets.all(0.0),
      color: const Color(0xFF1E1E1E),
      child: TextField(
        enabled: false,
        maxLines: null,
        expands: true,
        style: const TextStyle(
          fontFamily: g.mainFont,
          color: Colors.white,
          fontSize: 13,
        ),
        decoration: const InputDecoration(border: InputBorder.none),
        controller: TextEditingController(text: "TODO"),
      ),
    );
  }

  Widget textEditAPI() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "TODO"),
          ),
        ),
        textFooter(),
      ],
    );
  }

  Widget textEditPreProcess() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "Pre Process"),
          ),
        ),
        textFooter(),
      ],
    );
  }

  Widget textEditPostProcess() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "Post Process"),
          ),
        ),
        textFooter(),
      ],
    );
  }

  Widget textEditSpec() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "Spec"),
          ),
        ),
        textFooter(),
      ],
    );
  }

  Widget markdownDocument() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "Markdown Document"),
          ),
        ),
        textFooter(),
      ],
    );
  }

  Widget settingAPI() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            expands: true,
            style: const TextStyle(
              fontFamily: g.mainFont,
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            controller: TextEditingController(text: "Setting"),
          ),
        ),
      ],
    );
  }

  Widget switchEditMode() {
    final plaintextMode = false;
    return Center(
      child: Row(
        children: [
          Text('Plain ', style: TextStyle(color: Colors.white, fontSize: 13)),
          Switch(
            // This bool value toggles the switch.
            value: plaintextMode,
            activeColor: Colors.teal,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {

              });
            },
          ),
        ],
      ),
    );
  }

  Widget btnSend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // color: const Color(0xFF1E1E1E),
      child: Center(
        child: Row(
          children: [
            TextButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_circle_right, color: Colors.blue, size: 24),
              ),
              onPressed: () => "",
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdownEnvironment() {
    if (widget.workspaceCtrl.activeEnv.value == "") {
      widget.workspaceCtrl.activeEnv.value = widget.envCtrl.envs.first;
    }
    return DropdownButton<String>(
      value: widget.workspaceCtrl.activeEnv.value,
      icon: const Icon(Icons.data_object),
      style: const TextStyle(color: Colors.white),
      underline: Container(height: 0),
      onChanged: (String? value) {
        setState(() {
          widget.workspaceCtrl.activeEnv.value = value!;
        });
      },
      items: widget.envCtrl.envs.value.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }

  Widget dropdownExport() {
    var dropdownValue = 'Export';
    final list = <String>['Export', 'REST', 'CURL', 'Document'];
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.save_as),
      style: const TextStyle(color: Colors.white),
      underline: Container(height: 0),
      onChanged: (String? value) {
        // Save to Clipboard
        setState(() {});
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }

  Widget textFooter() {
    return Container(
      height: 36,
      color: const Color(0xFF007ACC),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.code, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text("build_info", style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Text("Ln 1, Col 1", style: TextStyle(color: Colors.white)),
                SizedBox(width: 16),
                Text("UTF-8", style: TextStyle(color: Colors.white)),
                SizedBox(width: 16),
                Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
