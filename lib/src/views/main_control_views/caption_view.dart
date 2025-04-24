import 'package:flutter/material.dart';
import 'package:flutter_story_editor/src/theme/style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// CaptionView is a StatelessWidget that provides UI for entering captions and initiating save operations.
class CaptionView extends StatelessWidget {
  final TextEditingController captionController; // Controller for text input.
  final VoidCallback
      onSaveClickListener; // Callback function when the save button is clicked.
  final FocusNode? focusNode; // Optional focus node to manage focus behavior.
  final bool
      isSaving; // Boolean indicating whether a save operation is in progress.

  // Constructor initializing all fields with required annotations for mandatory fields.
  const CaptionView(
      {super.key,
      required this.captionController,
      required this.onSaveClickListener,
      required this.isSaving,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    // Building the widget structure for the caption view.
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: const Color(0xFFFFD700),
                  width: 1,
                ),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: captionController,
                      cursorColor: tealColor,
                      focusNode: focusNode,
                      autocorrect: false,
                      enableSuggestions: false,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Decription...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onSaveClickListener,
                    child: isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/icons/send.svg',
                            color: Colors.white,
                            width: 20,
                            height: 20,
                          ),
                  ),
                  const SizedBox(width: 7),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // Row(
    //   children: [
    //     Expanded(
    //       child: Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 10),
    //         width: double.infinity,
    //         height: 50,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(
    //                 25), // Rounded corners for aesthetic appeal.
    //             color: darkGreenColor), // Background color set to dark green.
    //         child: TextFormField(
    //           focusNode: focusNode, // Assigning focus node if provided.
    //           controller:
    //               captionController, // Using the provided TextEditingController for text editing.
    //           style: const TextStyle(fontSize: 18), // Text style customization.
    //           cursorColor:
    //               tealColor, // Cursor color set to teal for visual consistency.
    //           decoration: const InputDecoration(
    //               border:
    //                   InputBorder.none, // No visual border for the input field.
    //               // Icon for a visual hint at the start of the input field.
    //               hintText: "Description", // Placeholder text.
    //               contentPadding: EdgeInsets.symmetric(
    //                   vertical: 15), // Padding inside the input field.
    //               hintStyle:
    //                   TextStyle(color: Colors.white)), // Hint text style.
    //         ),
    //       ),
    //     ),
    //     GestureDetector(
    //       onTap:
    //           onSaveClickListener, // Gesture detector to handle tap events on the save button.
    //       child: Container(
    //         width: 45,
    //         height: 45,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(
    //                 25), // Rounded corners for the button.
    //             color: tealColor), // Background color set to teal.
    //         child: Center(
    //           child: isSaving
    //               ? const SizedBox(
    //                   width: 20,
    //                   height: 20,
    //                   child: CircularProgressIndicator(
    //                     color: darkGreenColor,
    //                   ),
    //                 ) // Circular progress indicator when saving.
    //               : const Icon(
    //                   Icons.send_outlined,
    //                   color: Colors.white,
    //                 ), // Icon indicating send action.
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
