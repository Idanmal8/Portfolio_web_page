import 'package:flutter/material.dart';
import 'package:portfolio_website/model/avatar_circle.dart';

final ThemeData myPortfolioTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: const Color.fromARGB(255, 25, 24, 25),
);

double getFontSize(double screenWidth) {
    if(screenWidth < 300){
      return 18;
    } else if(screenWidth < 400){
      return 24;
    } else if(screenWidth < 560){
      return 28;
    } else if (screenWidth < 840) {
      return 40; 
    } else if (screenWidth < 1040) {
      return 60; 
    } else {
      return 75;
    }
  }

void getTechStackAnimationCircleSize(double screenWidth, AvatarCircle avatar) {
  if (screenWidth < 400) {
    avatar.pictureSize = 120;
    avatar.animationSize = 230;
    avatar.animationRadius = 100;
  } 
  else if (screenWidth < 840) {
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
