import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final TextStyle selectedTextStyle;
  final TextStyle normalTextStyle;

  const NavButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
    required this.selectedTextStyle,
    required this.normalTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.white.withOpacity(0.9) : Colors.transparent, disabledForegroundColor: Colors.white.withOpacity(0.5).withOpacity(0.38), // Use for disabled state
        textStyle: isSelected? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(fontWeight: FontWeight.normal),
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return Colors.white.withOpacity(0.1);
            return null; // Return null to use the default overlay color
          },
        ),
      ),
      child: Text(
        label,
        style: isSelected ? selectedTextStyle : normalTextStyle,
      ),
    );
  }
}
