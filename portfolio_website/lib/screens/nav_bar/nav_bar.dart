import 'package:portfolio_website/screens/about_me_screen/about_me_screen.dart';
import 'package:portfolio_website/screens/nav_bar/controller/nav_bar_controller.dart';
import 'package:portfolio_website/screens/nav_bar/widget/nav_button.dart';
import 'package:portfolio_website/controller/connection_controller.dart';
import 'package:portfolio_website/screens/home_screen/home_screen.dart';
import 'package:portfolio_website/screens/nav_bar/widget/drawer.dart';
import 'package:portfolio_website/screens/projects_screen/projects_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const TextStyle headlineOnPressedTextStyle = TextStyle(
      color: Color.fromARGB(255, 119, 82, 254),
    );
    const TextStyle headlineTextStyle = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
    );
    return ChangeNotifierProvider<NavBarController>(
      create: (context) => NavBarController(
        connectionController: context.read<ConnectionController>(),
      ),
      child: Consumer<NavBarController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                shadowColor: Colors.white,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.isCurrentScreenMobile(screenWidth)
                        ? Container()
                        : Expanded(
                            child: Row(
                              children: [
                                _hoverableLinkButton(
                                  onPressed: () => controller
                                      .openUrl(controller.faceBookLink),
                                  text: 'Facebook',
                                  icon: Icons.arrow_outward_rounded,
                                  textStyle: headlineTextStyle,
                                ),
                                _hoverableLinkButton(
                                  onPressed: () =>
                                      controller.openUrl(controller.gitHubLink),
                                  text: 'Github',
                                  icon: Icons.arrow_outward_rounded,
                                  textStyle: headlineTextStyle,
                                ),
                                _hoverableLinkButton(
                                  onPressed: () => controller
                                      .openUrl(controller.linkedInLink),
                                  text: 'LinkedIn',
                                  icon: Icons.arrow_outward_rounded,
                                  textStyle: headlineTextStyle,
                                ),
                              ],
                            ),
                          ),
                    controller.isCurrentScreenMobile(screenWidth)
                        ? Container()
                        : Expanded(
                            // Use Expanded to ensure that the right part takes up only necessary space
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                NavButton(
                                  label: 'Home',
                                  onPressed: () =>
                                      controller.onDestinationSelected(0),
                                  isSelected: controller.currentPageIndex == 0,
                                  selectedTextStyle: headlineOnPressedTextStyle,
                                  normalTextStyle: headlineTextStyle,
                                ),
                                const SizedBox(
                                    width:
                                        8), // Add some space between the buttons (optional
                                NavButton(
                                  label: 'Projects',
                                  onPressed: () =>
                                      controller.onDestinationSelected(1),
                                  isSelected: controller.currentPageIndex == 1,
                                  selectedTextStyle: headlineOnPressedTextStyle,
                                  normalTextStyle: headlineTextStyle,
                                ),
                                NavButton(
                                  label: 'About me',
                                  onPressed: () =>
                                      controller.onDestinationSelected(2),
                                  isSelected: controller.currentPageIndex == 2,
                                  selectedTextStyle: headlineOnPressedTextStyle,
                                  normalTextStyle: headlineTextStyle,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
            drawer: controller.isCurrentScreenMobile(screenWidth)
                ? const MenuDrawer()
                : null,
            body: IndexedStack(
              index: controller.currentPageIndex,
              children: const [
                HomeScreen(),
                ProjectsScreen(),
                AboutMeScreen(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _hoverableLinkButton(
      {required VoidCallback onPressed,
      required String text,
      required IconData icon,
      required TextStyle textStyle}) {
    return MouseRegion(
      onHover: (event) => {}, // Not needed for the hover effect
      onExit: (event) => {}, // Not needed for the hover effect
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white.withOpacity(0.1);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: textStyle),
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
