import 'package:flutter/material.dart';

class LineTextFieldScreen extends StatefulWidget {
  const LineTextFieldScreen({super.key});

  @override
  State<LineTextFieldScreen> createState() => _LineTextFieldScreenState();
}

class _LineTextFieldScreenState extends State<LineTextFieldScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _lineCount = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateLineCount);
    // Keep line numbers and text field scroll positions in sync
    _scrollController.addListener(() {
      setState(() {
        // This forces a rebuild for line numbers to update their position
      });
    });
  }

  void _updateLineCount() {
    final text = _controller.text;
    final lines = text.split('\n');
    setState(() {
      _lineCount = lines.length;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateLineCount);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // A very basic example of "syntax highlighting" - in a real app,
  // you'd use a more sophisticated parser and TextSpans or a package.
  TextSpan _buildHighlightedText(String text) {
    final List<TextSpan> spans = [];
    final lines = text.split('\n');

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      // Simple regex for keywords or comments - this is highly basic
      final RegExp keywordRegExp = RegExp(r'\b(class|void|import|return|int|String|var|const|final|if|else|for|while|true|false|null)\b');
      final RegExp commentRegExp = RegExp(r'//.*\$'); // Single line comments
      // final RegExp stringRegExp = RegExp(r'"[^"]*"|\'[^\']*\''); // Simple strings

      int lastMatchEnd = 0;

      // Combine all regex into one search if possible for efficiency or process sequentially
      final matches = <RegExpMatch>[
        ...keywordRegExp.allMatches(line),
        ...commentRegExp.allMatches(line),
        //   ...stringRegExp.allMatches(line),
      ];

      // Sort matches by their start index to process them in order
      // matches.sort((a, b) => a.start.compareTo(b.start));

      for (final match in matches) {
        // Add preceding plain text
        if (match.start > lastMatchEnd) {
          spans.add(TextSpan(text: line.substring(lastMatchEnd, match.start), style: const TextStyle(color: Colors.white)));
        }

        // Add highlighted text
        // Color highlightColor = Colors.white; // Default
        // if (keywordRegExp.any((element) => element.start == match.start && element.end == match.end)) {
        //   highlightColor = Colors.blueAccent; // Example keyword color
        // } else if (commentRegExp.any((element) => element.start == match.start && element.end == match.end)) {
        //   highlightColor = Colors.grey; // Example comment color
        // } else if (stringRegExp.any((element) => element.start == match.start && element.end == match.end)) {
        //   highlightColor = Colors.orangeAccent; // Example string color
        // }

        // spans.add(TextSpan(text: match.group(0), style: TextStyle(color: highlightColor)));
        lastMatchEnd = match.end;
      }

      // Add any remaining plain text after the last match
      if (lastMatchEnd < line.length) {
        spans.add(TextSpan(text: line.substring(lastMatchEnd), style: const TextStyle(color: Colors.white)));
      }

      if (i < lines.length - 1) {
        spans.add(const TextSpan(text: '\n')); // Add newline between lines
      }
    }
    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    // Determine the maximum width needed for line numbers
    final maxLineNumberWidth = (_lineCount.toString().length * 8.0) + 24.0; // Estimate width + padding

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Line Number Column
          Container(
            width: maxLineNumberWidth,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            color: const Color(0xFF252526), // Side panel color in VS Code
            child: ListView.builder(
              controller: _scrollController, // Link scroll controller
              itemCount: _lineCount,
              physics: const NeverScrollableScrollPhysics(), // Line numbers should not scroll independently
              itemBuilder: (context, index) {
                return Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey, // Grey color for line numbers
                  ),
                );
              },
            ),
          ),
          // Code Editor Area
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Allow horizontal scrolling
              child: IntrinsicWidth(
                child: TextField(
                  controller: _controller,
                  scrollController: _scrollController, // Link scroll controller
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allow unlimited lines
                  expands: true, // Allow TextField to expand vertically within its parent
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Colors.white, // VS Code cursor color
                  decoration: const InputDecoration(
                    hintText: 'Start typing your code here...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 16.0, top: 16.0), // Padding inside the TextField
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
