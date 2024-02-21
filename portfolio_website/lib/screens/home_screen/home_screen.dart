import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/home_screen/widgets/gradient_text.dart';
import 'package:portfolio_website/screens/home_screen/widgets/tech_stack_animation.dart';
import 'package:portfolio_website/theme.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeLarge = getFontSize(screenWidth);

    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      GradientText(
                        text: 'Hello. I\'m Idan.',
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
                          fontSize: fontSizeLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GradientText(
                        text: 'I\'m a Full Stack Developer.',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 119, 82, 254),
                            Color.fromARGB(255, 142, 143, 250),
                            Color.fromARGB(255, 194, 217, 255),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: fontSizeLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const TechStackAnimation(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
