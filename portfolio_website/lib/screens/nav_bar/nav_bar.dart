import 'package:portfolio_website/screens/nav_bar/controller/nav_bar_controller.dart';
import 'package:portfolio_website/screens/home_screen/home_screen.dart';
import 'package:portfolio_website/controller/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/nav_bar/widget/drawer.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const TextStyle headlineOnPressedTextStyle = TextStyle(
      color: Color.fromARGB(255, 142, 143, 250),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () => controller
                                      .openUrl(controller.faceBookLink),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Facebook',
                                          style: headlineTextStyle),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_outward_rounded,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      controller.openUrl(controller.gitHubLink),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Github', style: headlineTextStyle),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_outward_rounded,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => controller
                                      .openUrl(controller.linkedInLink),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('LinkedIn',
                                          style: headlineTextStyle),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_outward_rounded,
                                          color: Colors.white),
                                    ],
                                  ),
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
                                TextButton(
                                  child: Text('Home',
                                      style: controller.currentPageIndex == 0
                                          ? headlineOnPressedTextStyle
                                          : headlineTextStyle),
                                  onPressed: () =>
                                      controller.onDestinationSelected(0),
                                ),
                                TextButton(
                                  child: Text('Projects',
                                      style: controller.currentPageIndex == 1
                                          ? headlineOnPressedTextStyle
                                          : headlineTextStyle),
                                  onPressed: () =>
                                      controller.onDestinationSelected(1),
                                ),
                                TextButton(
                                  child: Text('About me',
                                      style: controller.currentPageIndex == 2
                                          ? headlineOnPressedTextStyle
                                          : headlineTextStyle),
                                  onPressed: () =>
                                      controller.onDestinationSelected(2),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
            drawer: controller.isCurrentScreenMobile(screenWidth) ? const MenuDrawer() : null,
            body: IndexedStack(
              index: controller.currentPageIndex,
              children: const [
                HomeScreen(),
                // Uncomment and replace these with your actual screens
                // CustomersScreen(),
                // CalendarScreen(),
                // ProfileScreen(),
                // Add more screens as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
