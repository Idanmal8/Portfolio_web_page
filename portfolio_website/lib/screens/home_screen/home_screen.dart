import 'package:portfolio_website/screens/home_screen/controller/home_scree_controller.dart';
import 'package:portfolio_website/screens/home_screen/widgets/git_repo_widget.dart';
import 'package:portfolio_website/screens/home_screen/widgets/icon_information_bottom_widget.dart';
import 'package:portfolio_website/screens/home_screen/widgets/tech_stack_animation.dart';
import 'package:portfolio_website/utilities/gradient_text.dart';
import 'package:portfolio_website/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeLarge = getFontSizeGeneralHeadline(screenWidth);

    return ChangeNotifierProvider<HomeScreenController>(
      create: (context) => HomeScreenController(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                            const SizedBox(height: 20),
                            const TechStackAnimation(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.5,
                    //   child: const GitRepoWidget(),
                    // ),
                  ],
                ),
              ),
              Consumer<HomeScreenController>(
                builder: (context, controller, _) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor, // Add a background color if needed
                              border: Border.all(
                                color: const Color.fromARGB(255, 194, 217, 255),
                              ),
                              borderRadius: BorderRadius.circular(
                                  5), // Adds border radius
                            ),
                            padding: const EdgeInsets.all(
                                10), // Adjust padding as needed
                            child: IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  BottomInformationCard(
                                    icon: Icons.email,
                                    title: 'Idanmalkadb@gmail.com',
                                    onPressed: () => controller.goToMail(),
                                  ),
                                  const Text(
                                    ' | ',
                                    style: TextStyle(
                                        color:
                                            Colors.white), // Divider thickness
                                  ),
                                  const BottomInformationCard(
                                    icon: Icons.phone,
                                    title: '+972523067197',
                                  ),
                                  const Text(
                                    ' | ',
                                    style: TextStyle(
                                        color:
                                            Colors.white), // Divider thickness
                                  ),
                                  const BottomInformationCard(
                                    icon: Icons.location_on,
                                    title: 'Kiryat Ono',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2024 Idan Malka. All Rights Reserved.',
                      style:
                          TextStyle(color: Color.fromARGB(255, 194, 217, 255)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
