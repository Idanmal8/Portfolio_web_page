import 'package:flutter/material.dart';

class MyStorySegment extends StatelessWidget {
  const MyStorySegment({
    super.key,
    required this.screenWidth,
    required this.imageSize,
  });

  final double screenWidth;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded( // Added Expanded for better layout control
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MY STORY',
                    style:
                        TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 10),
                Text(
                  'My name is Idan Malka, and I am a software developer. \n'
                  'Ever since I was a teen I was always fascinated by the world of technology and computers.\n'
                  'After enrolling for my BS.c in software engineering I realized there is no limit to creating cutting-edge\n'
                  'solutions and going above and beyond with our imagination.\n'
                  'I am a hard-working and dedicated person, always looking for new challenges and opportunities to grow and learn.\n',
                  style:
                      TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            width: imageSize,
            height: imageSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/my_pictures/about_me_page.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
