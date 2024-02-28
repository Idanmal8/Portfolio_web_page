import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/about_me_screen/widgets/education_segment.dart';
import 'package:portfolio_website/screens/about_me_screen/widgets/expirience_segment.dart';
import 'package:portfolio_website/screens/about_me_screen/widgets/my_story_segment.dart';
import 'package:portfolio_website/screens/nav_bar/controller/nav_bar_controller.dart';
import 'package:portfolio_website/theme.dart';
import 'package:portfolio_website/utilities/gradient_text.dart';
import 'package:provider/provider.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen>
    with TickerProviderStateMixin {
  late AnimationController _myStoryController;
  late AnimationController _myExperienceController;
  late AnimationController _educationController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _myStoryController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _myExperienceController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _educationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Listen to changes in the current page index from the NavBarController
    final navBarController =
        Provider.of<NavBarController>(context, listen: false);
    navBarController.addListener(() {
      if (navBarController.currentPageIndex == 2) {
        // Assuming index 2 is for AboutMeScreen
        _startAnimations();
      } else {
        _resetAnimations();
      }
    });
  }

  void _startAnimations() {
    _myStoryController.forward();
    _myExperienceController.forward();
    _educationController.forward();
  }

  void _resetAnimations() {
    _myStoryController.reset();
    _myExperienceController.reset();
    _educationController.reset();
  }

  @override
  void dispose() {
    _myStoryController.dispose();
    _myExperienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeLarge = getFontSizeGeneralHeadline(
        screenWidth); // Ensure you have this method defined

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GradientText(
                  text: 'About Me',
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 212, 212, 212),
                      Color.fromARGB(255, 184, 184, 184),
                    ],
                  ),
                  style: TextStyle(
                      fontSize: fontSizeLarge, fontWeight: FontWeight.bold),
                ),
              ),
              FadeTransition(
                opacity: _myStoryController,
                child: MyStorySegment(
                  screenWidth: screenWidth,
                ),
              ),
              FadeTransition(
                opacity: _myExperienceController,
                child: MyExpirienceSegment(screenWidth: screenWidth),
              ),
              FadeTransition(
                opacity: _educationController,
                child: EducationSegment(screenWidth: screenWidth),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '© 2024 Idan Malka. All Rights Reserved.',
                    style: TextStyle(color: Color.fromARGB(125, 119, 82, 254)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
