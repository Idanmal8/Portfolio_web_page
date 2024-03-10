import 'dart:math';

import 'package:portfolio_website/screens/projects_screen/controller/projects_controller.dart';
import 'package:portfolio_website/screens/projects_screen/widgets/project_box.dart';
import 'package:portfolio_website/screens/projects_screen/widgets/project_box_v2/project_box_v2.dart';
import 'package:portfolio_website/utilities/gradient_text.dart';
import 'package:portfolio_website/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double minItemWidth = 200.0; // Minimum item width you desire
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeLarge = getFontSizeGeneralHeadline(screenWidth);
    int crossAxisCount = screenWidth ~/ minItemWidth;
    crossAxisCount = max(crossAxisCount, 1); // Ensure at least 1 column

    return ChangeNotifierProvider<ProjectsController>(
      create: (context) => ProjectsController(),
      child: Consumer<ProjectsController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Add some padding around the GradientText
                      child: GradientText(
                        text: 'Projects',
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
                    ),
                    const SizedBox(height: 16), // Spacing at the top
                    SizedBox(
                      width: screenWidth * 0.7,
                      // Removed Wrap widget and replaced with GridView.builder
                      child: GridView.builder(
                        shrinkWrap:
                            true, // Allows GridView to work within SingleChildScrollView
                        physics:
                            const NeverScrollableScrollPhysics(), // Disables scrolling within GridView
                        itemCount: controller.projects.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenWidth < 1250
                              ? 1
                              : 2, // Creates a grid with 2 columns
                          crossAxisSpacing: screenWidth < 1250
                              ? 8
                              : 16, // Horizontal space between items
                          mainAxisSpacing: screenWidth < 1250
                              ? 8
                              : 16, // Vertical space between items
                          childAspectRatio: (screenWidth / crossAxisCount) /
                              (screenWidth /
                                  crossAxisCount /
                                  (2.8)), // Adjust based on your content
                        ),
                        itemBuilder: (context, index) {
                          final project = controller.projects[index];
                          return ProjectBox(
                            name: project.name,
                            languages: project.languages,
                            onPressedGit: () {
                              controller
                                  .openUrl(Uri.parse(project.onPressedGit));
                            },
                            onPressedLink: project.onPressedLink != null
                                ? () {
                                    controller.openUrl(
                                        Uri.parse(project.onPressedLink!));
                                  }
                                : null,
                            isPrivate: project.isPrivate,
                          );
                        },
                      ),
                    ),
                    const ProjectBoxV2(),
                    const SizedBox(height: 16),
                    // Spacing at the bottom
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '© 2024 Idan Malka. All Rights Reserved.',
                            style: TextStyle(
                                color: const Color.fromARGB(125, 119, 82, 254),
                                fontSize: getDynamicFontSizeForProjectsTitles(screenWidth) * 0.5),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
