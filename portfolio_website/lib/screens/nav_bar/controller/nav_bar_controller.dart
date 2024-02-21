import 'package:portfolio_website/controller/connection_controller.dart';
import 'package:portfolio_website/screens/404_screen/error_screen.dart';
import 'package:portfolio_website/utilities/constant_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/theme.dart';
import 'package:flutter/material.dart';

class NavBarController extends ChangeNotifier {
  final ConnectionController _connectionController;
  int currentPageIndex = 0;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Uri get faceBookLink => ConstantLinks().facebook;
  Uri get gitHubLink => ConstantLinks().github;
  Uri get linkedInLink => ConstantLinks().linkedIn;

  NavBarController({
    required ConnectionController connectionController,
  }) : _connectionController = connectionController {
    _init(); // Call _init here to perform the check as soon as the controller is initialized
  }

  // New method to check if the current screen width is considered mobile
  bool isCurrentScreenMobile(double screenWidth) {
    return isMobile(screenWidth);
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    bool isConnected = await _connectionController.hasInternetConnection();
    if (!isConnected) {
      debugPrint('Not connected');
      goToErrorScreen;
    }
    debugPrint('connected');

    _isLoading = false;
    notifyListeners();
  }

  Future<void> openUrl(Uri url) async {
    notifyListeners();

    if (await canLaunchUrl(url)) {
      await launchUrl(
          url); // This now correctly refers to the method from url_launcher
    } else {
      debugPrint('Could not launch $url');
    }

    notifyListeners();
  }

  Future<void> onDestinationSelected(int index) async {
    currentPageIndex = index;
    notifyListeners();
  }

  Future<void> goToErrorScreen(BuildContext context) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ErrorConnetionScreen()));
  }
}
