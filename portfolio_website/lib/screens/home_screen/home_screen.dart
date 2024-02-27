import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_website/screens/home_screen/widgets/tech_stack_animation.dart';
import 'package:portfolio_website/utilities/gradient_text.dart';
import 'package:portfolio_website/theme.dart'; // Make sure this path is correct

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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      GradientText(
                        text: 'Hello. I\'m Your Name.',
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
                      const SizedBox(height: 80),
                      const TechStackAnimation(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '© 2024 Idan Malka. All Rights Reserved.',
                            style: TextStyle(
                                color: Color.fromARGB(125, 119, 82, 254)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
