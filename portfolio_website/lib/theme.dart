import 'package:flutter/material.dart';
import 'package:portfolio_website/model/avatar_circle.dart';

final ThemeData myPortfolioTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: const Color.fromARGB(255, 25, 24, 25),
  primaryColor: Colors.white,
  hintColor: const Color.fromARGB(255, 142, 143, 250),
);

double getFontSizeGeneralHeadline(double screenWidth) {
  if (screenWidth < 300) {
    return 18;
  } else if (screenWidth < 400) {
    return 24;
  } else if (screenWidth < 560) {
    return 28;
  } else if (screenWidth < 840) {
    return 40;
  } else if (screenWidth < 1040) {
    return 60;
  } else {
    return 75;
  }
}

double getIconSizeProjects(double screenWidth) {
  if (screenWidth < 400) {
    return 0;
  } else if (screenWidth < 560) {
    return 10;
  } else if (screenWidth < 840) {
    return 15;
  } else if (screenWidth < 1300) {
    return 20;
  } else {
    return 30;
  }
}

double getDynamicFontSizeForProjectsTitles(double screenWidth) {
  // Define your breakpoints and corresponding font sizes
  if (screenWidth < 300) {
    return 12; // Smaller screen, smaller font
  } else if (screenWidth < 400) {
    return 14;
  } else if (screenWidth < 560) {
    return 16;
  } else if (screenWidth < 840) {
    return 18;
  } else if (screenWidth < 1040) {
    return 18;
  } else {
    return 22; // Larger screen, larger font
  }
}

double getDynamicFontSizeForProjectsSubTitles(double screenWidth) {
  // Define your breakpoints and corresponding font sizes
  if (screenWidth < 400) {
    return 0;
  } else if (screenWidth < 560) {
    return 9;
  } else if (screenWidth < 840) {
    return 11;
  } else if (screenWidth < 1300) {
    return 10;
  } else {
    return 15; // Larger screen, larger font
  }
}

double getDynamicSpacingForProjects(double screenWidth) {
  return screenWidth < 840 ? 8 : 15;
}

double getFontSizeAboutMePage(double screenWidth) {
  if (screenWidth < 300) {
    return 10;
  } else if (screenWidth < 940) {
    return 12;
  } else if (screenWidth < 1200) {
    return 14;
  } else {
    return 16;
  }
}

double getImageSize(double screenWidth) {
  return isMobile(screenWidth) ? 150 : 200;
}

void getTechStackAnimationCircleSize(double screenWidth, AvatarCircle avatar) {
  if (screenWidth < 400) {
    avatar.pictureSize = 120;
    avatar.animationSize = 230;
    avatar.animationRadius = 100;
  } else if (screenWidth < 840) {
    avatar.pictureSize = 200;
    avatar.animationSize = 350;
    avatar.animationRadius = 150;
  } else if (screenWidth < 1040) {
    avatar.pictureSize = 300;
    avatar.animationSize = 450;
    avatar.animationRadius = 200;
  } else {
    avatar.pictureSize = 400;
    avatar.animationSize = 550;
    avatar.animationRadius = 250;
  }
  return;
}

bool isMobile(double screenWidth) {
  return screenWidth < 840;
}
