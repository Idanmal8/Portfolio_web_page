import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/model/avatar_circle.dart';
import 'package:portfolio_website/theme.dart';

class TechStackAnimation extends StatefulWidget {
  const TechStackAnimation({super.key});

  @override
  TechStackAnimationState createState() => TechStackAnimationState();
}

class TechStackAnimationState extends State<TechStackAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AvatarCircle avatar = AvatarCircle(pictureSize: 400, animationSize: 550, animationRadius: 250);
  // List of assets for demonstration. Replace with your actual assets.
  final List<String> assets = [
    'assets/tech_stack_assets/c-original.svg',
    'assets/tech_stack_assets/cplusplus-original.svg',
    'assets/tech_stack_assets/css3-original.svg',
    'assets/tech_stack_assets/dart-original.svg',
    'assets/tech_stack_assets/docker-original.svg',
    'assets/tech_stack_assets/flask-original.svg',
    'assets/tech_stack_assets/flutter-original.svg',
    'assets/tech_stack_assets/html5-original.svg',
    'assets/tech_stack_assets/java-original.svg',
    'assets/tech_stack_assets/javascript-original.svg',
    'assets/tech_stack_assets/mysql-original.svg',
    'assets/tech_stack_assets/nginx-original.svg',
    'assets/tech_stack_assets/nodejs-original.svg',
    'assets/tech_stack_assets/postgresql-original.svg',
    'assets/tech_stack_assets/python-original.svg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    getTechStackAnimationCircleSize(screenWidth, avatar); // This function modifies the avatar directly
    
    double radius = avatar.animationRadius;

    return SizedBox(
      width: avatar.animationSize,
      height: avatar.animationSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: avatar.pictureSize,
            height: avatar.pictureSize,
            child: ClipOval(
              child: Image.asset('assets/my_pictures/idan3.jpeg',
                  fit: BoxFit.cover),
            ),
          ),
          ...List.generate(assets.length, (index) {
            // Calculate the angle for this item
            final double angle = 2 * math.pi * index / assets.length;
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Calculate the current position based on the angle and the controller's value
                final double currentAngle =
                    angle + (2 * math.pi * _controller.value);
                final double x = radius * math.cos(currentAngle);
                final double y = radius * math.sin(currentAngle);
                return Positioned(
                  left: radius +
                      x, // Adjust based on the new radius and desired layout
                  top: radius +
                      y, // Adjust based on the new radius and desired layout
                  child: child!,
                );
              },
              child: _buildOvalAsset(assets[index], screenWidth),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildOvalAsset(String assetName, double screenWidth) {
    return Container(
      width: screenWidth < 400 ? 30.0 : 50.0,
      height: screenWidth < 400 ? 30.0 : 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200], // Optional: Background color for the oval
      ),
      child: ClipOval(
        child: Center(
          child: SvgPicture.asset(
            assetName,
            width: screenWidth < 400 ? 25.0 : 35.0,
            height: screenWidth < 400 ? 25.0 : 35.0,
          ),
        ),
      ),
    );
  }
}
