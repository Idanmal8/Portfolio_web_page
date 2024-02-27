import 'package:portfolio_website/theme.dart';
import 'package:flutter/material.dart';

class ProjectBox extends StatefulWidget {
  final List<String> languages;
  final String name;
  final VoidCallback onPressedGit;
  final VoidCallback? onPressedLink;
  final bool isPrivate;

  const ProjectBox({
    super.key,
    required this.languages,
    required this.name,
    required this.onPressedGit,
    this.onPressedLink,
    required this.isPrivate,
  });

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isHovered
        ? const Color.fromARGB(255, 131, 111, 255)
        : const Color.fromARGB(255, 46, 56, 64);
    final textColor =
        isHovered ? const Color.fromARGB(255, 17, 18, 19) : Colors.white;
    final List<BoxShadow> boxShadow = isHovered
        ? [
            const BoxShadow(
              color: Color.fromARGB(255, 119, 82, 254),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 0), // Shadow direction: bottom right
            )
          ]
        : [];

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressedGit,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.isPrivate
                          ? Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: getIconSizeProjects(
                                  MediaQuery.of(context).size.width),
                            )
                          : GestureDetector(
                              onTap: widget.onPressedGit, // Image tapped
                              child: Image.asset(
                                color: Colors.white,
                                'assets/project_box_icons/github.png',
                                fit: BoxFit.cover, // Fixes border issues
                                width: getIconSizeProjects(
                                    MediaQuery.of(context).size.width),
                                height: getIconSizeProjects(
                                    MediaQuery.of(context).size.width),
                              ),
                            ),
                      const SizedBox(width: 8),
                      if (widget.onPressedLink != null)
                        InkWell(
                          onTap: widget.onPressedLink, // Image tapped
                          splashColor:
                              Colors.white10, // Splash color over image
                          child: Ink.image(
                            fit: BoxFit.cover, // Fixes border issues
                            width: getIconSizeProjects(
                                MediaQuery.of(context).size.width),
                            height: getIconSizeProjects(
                                MediaQuery.of(context).size.width),
                            image: const AssetImage(
                              'assets/project_box_icons/link.png',
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(getDynamicSpacingForProjects(
                        MediaQuery.of(context).size.width)),
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: textColor,
                        fontSize: getDynamicFontSizeForProjectsTitles(
                            MediaQuery.of(context).size.width),
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Text(
                        widget.name,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 1,
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: isHovered
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : const Color.fromARGB(255, 110, 110, 110),
                        fontSize: getDynamicFontSizeForProjectsSubTitles(
                            MediaQuery.of(context).size.width),
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Text(
                        widget.languages.join(', '),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
