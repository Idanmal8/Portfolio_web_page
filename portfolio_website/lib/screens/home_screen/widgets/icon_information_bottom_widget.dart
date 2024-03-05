import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomInformationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;

  const BottomInformationCard({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 25,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(width: 15),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: title,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    recognizer: TapGestureRecognizer()..onTap = onPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
