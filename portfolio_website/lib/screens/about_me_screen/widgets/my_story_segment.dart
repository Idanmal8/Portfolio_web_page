import 'package:flutter/material.dart';
import 'package:portfolio_website/theme.dart';

class MyStorySegment extends StatelessWidget {
  const MyStorySegment({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    double imageSize = getImageSize(screenWidth);
    TextStyle fontStyle = TextStyle(
        color: Colors.white, fontSize: getFontSizeAboutMePage(screenWidth));
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8,
      child: isMobile(screenWidth)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MY STORY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            getDynamicFontSizeForProjectsTitles(screenWidth),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'My name is Idan Malka, and I am a software developer. \n'
                      'Ever since I was a teen I was always fascinated by the world of technology and computers.\n'
                      'After enrolling for my BS.c in software engineering I realized there is no limit to creating cutting-edge\n'
                      'solutions and going above and beyond with our imagination.\n'
                      'I am a hard-working and dedicated person, always looking for new challenges and opportunities to grow and learn.\n',
                      style: fontStyle,
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // Added Expanded for better layout control
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MY STORY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              getDynamicFontSizeForProjectsTitles(screenWidth),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'My name is Idan Malka, and I am a software developer. \n'
                        'Ever since I was a teen I was always fascinated by the world of technology and computers.\n'
                        'After enrolling for my BS.c in software engineering I realized there is no limit to creating cutting-edge\n'
                        'solutions and going above and beyond with our imagination.\n'
                        'I am a hard-working and dedicated person, always looking for new challenges and opportunities to grow and learn.\n',
                        style: fontStyle,
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
