import 'package:flutter/material.dart';
import 'package:apispec/global.dart' as g;
import 'package:apispec/mock.dart' as m;
import 'package:apispec/screens/line_text_field.dart';


class VSCodeHomePage extends StatefulWidget {
  const VSCodeHomePage({super.key});

  @override
  State<VSCodeHomePage> createState() => _VSCodeHomePageState();
}

class _VSCodeHomePageState extends State<VSCodeHomePage> {
  int _selectedActivityIndex = 0;
  bool _isSideBarVisible = true;

  void _toggleSideBar() {
    setState(() {
      _isSideBarVisible = !_isSideBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: <Widget>[
          // Activity Bar
          Container(
            width: 48,
            color: const Color(0xFF333333),
            child: Column(
              children: <Widget>[
                getIconDescription(),
                getIconSearch(),
                getIconCode(),
                const Spacer(),
                getIconSetting(),
              ],
            ),
          ),

          // Side Bar (File Explorer)
          if (_isSideBarVisible)
            getSideBar(),

          // Main
          Expanded(
            child: Column(
              children: <Widget>[
                // HTTP Request
                Container(
                  height: 35,
                  color: const Color(0xFF252526),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        color: const Color(0xFF1E1E1E),
                        child: const Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.blue,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "build_info",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // HTTP Response
                getExpandedResponse(),
                // Status Bar
                Container(
                  height: 25,
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
                            Text("main", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Ln 1, Col 1",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 16),
                            Text(
                              "UTF-8",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // HTTP Result
          getTitleResponse()
        ],
      ),
    );
  }

  IconButton getIconDescription() {
    return IconButton(
      icon: const Icon(Icons.description),
      color: _selectedActivityIndex == 0
          ? Colors.white
          : Colors.grey,
      onPressed: () {
        setState(() {
          _selectedActivityIndex = 0;
          if (!_isSideBarVisible) _isSideBarVisible = true;
        });
      },
    );
  }

  IconButton getIconSearch() {
    return IconButton(
      icon: const Icon(Icons.search),
      color: _selectedActivityIndex == 1
          ? Colors.white
          : Colors.grey,
      onPressed: () {
        setState(() {
          _selectedActivityIndex = 1;
          if (!_isSideBarVisible) _isSideBarVisible = true;
        });
      },
    );
  }

  IconButton getIconCode() {
    return IconButton(
      icon: const Icon(Icons.code),
      color: _selectedActivityIndex == 2
          ? Colors.white
          : Colors.grey,
      onPressed: () {
        setState(() {
          _selectedActivityIndex = 2;
          if (!_isSideBarVisible) _isSideBarVisible = true;
        });
      },
    );
  }

  IconButton getIconSetting() {
    return IconButton(
      icon: const Icon(Icons.settings),
      color: Colors.grey,
      onPressed: () {},
    );
  }

  Container getSideBar() {
    return Container(
      width: 248,
      color: const Color(0xFF252526),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Workspace", style: TextStyle(color: Colors.grey, fontSize: 12), ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.insert_drive_file,
                      color: Colors.blue,
                      size: 16,
                    ),
                    title: Text(
                      "build_info",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    dense: true,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.insert_drive_file,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    title: Text(
                      "signin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    dense: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getTitleResponse() {
    return Container(
      width: 512,
      color: const Color(0xFF333333),
      child: Column(
        children: <Widget>[
          // Editor Tabs
          Container(
            height: 35,
            color: const Color(0xFF252526),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: const Color(0xFF1E1E1E),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.article,
                          color: Colors.blue,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Response",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Code Editor Area
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: const Color(0xFF1E1E1E),
              child: LineTextField(),
            ),
          ),
        ],
      ),
    );
  }

  Expanded getExpandedResponse() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        color: const Color(0xFF1E1E1E),
        child: TextField(
          maxLines: null,
          expands: true,
          style: const TextStyle(
            fontFamily: g.mainFont,
            color: Colors.white,
            fontSize: 14,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: TextEditingController(text: m.sampleCode),
        ),
      ),
    );
  }
}
