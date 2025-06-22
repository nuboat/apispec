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
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[textFieldBody(), textFooter()],
                  ),
                ),
                Expanded(child: textFieldBody()),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF444444),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.wysiwyg, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("API", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Text("{ pre }", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_back_ios, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("{ post }", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.grading, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("Spec", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.article, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("Document", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.play_arrow, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("Send", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color(0xFF1E1E1E),
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.data_object, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Text("Data", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ],
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
