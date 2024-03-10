import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData? icon;

  const TitleCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
