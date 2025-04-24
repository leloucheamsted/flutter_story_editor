import 'package:flutter/material.dart';
import 'package:flutter_story_editor/src/controller/controller.dart';
import 'package:flutter_story_editor/src/enums/story_editing_modes.dart';

class FilterTextView extends StatelessWidget {
  final FlutterStoryEditorController
      controller; // FlutterStoryEditorController to take decision based on certain editing state
  const FilterTextView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      //duration: const Duration(milliseconds: 200),
      opacity: 1,
      child: AnimatedContainer(
        height: controller.editingModeSelected == StoryEditingModes.filters
            ? 50
            : 50, // change height based on showFilters
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            Icon(
              controller.editingModeSelected == StoryEditingModes.filters
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up,
              size: 25,
              color: Colors.white,
            ),
            const Text(
              "Filters",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
