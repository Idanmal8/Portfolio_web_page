import 'package:flutter/material.dart';

class EducationSegment extends StatelessWidget {
  final double screenWidth;

  const EducationSegment({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EDUCATION',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 2),
                Text('2020 - 2024', style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 5),
                Text(
                  'BSc in Software engineering @ Azrieli College of Engineering Jerusalem.\n',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
