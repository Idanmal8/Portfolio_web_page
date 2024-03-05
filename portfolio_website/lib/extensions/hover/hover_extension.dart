// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

extension HoverColorExtensions on Widget {
  static final appContainer = html.window.document.getElementById('app-container');

  Widget withHoverColor(Color hoverColor, {Duration duration = const Duration(milliseconds: 200)}) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        Color currentColor = Colors.transparent; // Start with default color as transparent
        return MouseRegion(
          onHover: (event) {
            setState(() {
              appContainer?.style.cursor = 'pointer';
              currentColor = hoverColor; // Change to hover color
            });
          },
          onExit: (event) {
            setState(() {
              appContainer?.style.cursor = 'default';
              currentColor = Colors.transparent; // Revert to default color
            });
          },
          child: AnimatedContainer(
            duration: duration,
            color: currentColor, // This will not affect TextButton directly. See explanation below.
            child: this,
          ),
        );
      },
    );
  }
}
