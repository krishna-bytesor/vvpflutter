// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';

class RichTextEditor extends StatefulWidget {
  const RichTextEditor({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;

  @override
  _RichTextEditorState createState() => _RichTextEditorState();
}

class _RichTextEditorState extends State<RichTextEditor> {
  HtmlEditorController controller =
      HtmlEditorController(processInputHtml: true);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // Function to get the HTML content
  Future<void> getContent() async {
    String? text = await controller.getText(); // Get content from the editor
    if (text != null) {
      FFAppState().update(() {
        FFAppState().textFromHtmlEditor = text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300.0,
      child: HtmlEditor(
        controller: controller,
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Type your Text here",
          initialText: widget.currentHtml?.isNotEmpty == true
              ? widget.currentHtml
              : null,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarType: ToolbarType.nativeGrid,
          defaultToolbarButtons: [
            FontButtons(
              bold: true, // Show bold button
              italic: true, // Show italic button
              underline: true, // Show underline button
              clearAll: false, // Hide clear formatting button
              strikethrough: false, // Hide strikethrough button
              superscript: false, // Hide superscript button
              subscript: false, // Hide subscript button
            ),
            ListButtons(
              ul: true, // Show bullet points (unordered list)
              ol: false, // Hide numbered list (ordered list)
              listStyles: false,
            ),
            ColorButtons(
              foregroundColor: true, // Show font color button
              highlightColor: false, // Hide background color button
            ),
          ],
        ),
        otherOptions: OtherOptions(
            // html_editor_enhanced does NOT support cursorColor directly.
            // If you want a black cursor, you must use a different editor or request this feature from the package author.
            ),
        callbacks: Callbacks(onChangeContent: (String? changed) {
          getContent();
          print('content changed to $changed');
        }),
      ),
    );
  }
}
