import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_story_editor/src/const/filters.dart';
import 'package:flutter_story_editor/src/controller/controller.dart';
import 'package:flutter_story_editor/src/models/stroke.dart';
import 'package:flutter_story_editor/src/utils/utils.dart';
import 'package:flutter_story_editor/src/widgets/draggable_sticker_widget.dart';
import 'package:flutter_story_editor/src/widgets/draggable_text_widget.dart';
import 'package:flutter_svg/svg.dart';

// TopView is a StatefulWidget that provides the top bar interface for story editing controls.
class CenterView extends StatefulWidget {
  final File selectedFile; // The currently selected file for editing.
  final VoidCallback
      onTapCropListener; // Callback for handling crop operations.
  final int currentPageIndex; // Index of the current page being edited.
  final List<List<double>>
      selectedFilters; // Current filter applied to each file page.
  final List<List<DraggableTextWidget>>
      textList; // List of text widgets added to each file page.
  final List<List<DraggableStickerWidget>>
      stickerList; // List of sticker widgets added to each file page.
  final VoidCallback onUndoClickListener; // Callback for undo operations.
  final VoidCallback
      onPaintClickListener; // Callback for activating the paint editing mode.
  final VoidCallback
      onTextClickListener; // Callback for activating the text editing mode.
  final VoidCallback
      onStickersClickListener; // Callback for activating the stickers editing mode.
  final List<Stroke> lines; // List of all drawing strokes on the current page.
  final FlutterStoryEditorController
      controller; // Controller for managing editor state.

  // Constructor for initializing TopView with required parameters.
  const CenterView(
      {super.key,
      required this.selectedFile,
      required this.onTapCropListener,
      required this.currentPageIndex,
      required this.selectedFilters,
      required this.onUndoClickListener,
      required this.onPaintClickListener,
      required this.lines,
      required this.controller,
      required this.onTextClickListener,
      required this.textList,
      required this.onStickersClickListener,
      required this.stickerList});

  @override
  State<CenterView> createState() => _CenterViewState();
}

// State class for TopView, handles the rendering of the top toolbar.
class _CenterViewState extends State<CenterView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isVideo(widget.selectedFile))
          Column(
            children: [
              GestureDetector(
                onTap: widget.onStickersClickListener,
                child: SvgPicture.asset(
                  "assets/icons/sticker.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Icon for accessing text controls.
              GestureDetector(
                onTap: widget.onTextClickListener,
                child: SvgPicture.asset(
                  "assets/icons/text.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
