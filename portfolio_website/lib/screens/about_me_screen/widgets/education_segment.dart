import 'package:portfolio_website/theme.dart';
import 'package:flutter/material.dart';

class EducationSegment extends StatelessWidget {
  final double screenWidth;

  const EducationSegment({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle = TextStyle(color: Colors.white, fontSize: getFontSizeAboutMePage(screenWidth));
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EDUCATION',
                    style: TextStyle(color: Colors.white, fontSize: getDynamicFontSizeForProjectsTitles(screenWidth))),
                const SizedBox(height: 2),
                Text('2020 - 2024',
                    style: fontStyle),
                const SizedBox(height: 5),
                Text(
                  'BSc in Software engineering @ Azrieli College of Engineering Jerusalem.\n',
                  style: fontStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
