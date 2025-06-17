import 'package:flutter/material.dart';
import 'package:apispec/global.dart' as g;

class APIView extends StatefulWidget {
  const APIView({super.key});

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
                Expanded(
                  child: Column(
                    children: <Widget>[
                      textFieldBody(),
                      textFooter(),
                    ],
                  ),
                ),
                Expanded(child: Text("Response")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget actionBar() {
    return Container(
      height: 36,
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [Text("Run", style: TextStyle(color: Colors.white))],
            ),
          ],
        ),
      ),
    );
  }

  Widget request() {
    return Container(
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: [Text("Request")]),
          ],
        ),
      ),
    );
  }

  Widget textFieldBody() {
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
            fontSize: 13,
          ),
          decoration: const InputDecoration(border: InputBorder.none),
          controller: TextEditingController(text: g.sampleCode),
        ),
      ),
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
