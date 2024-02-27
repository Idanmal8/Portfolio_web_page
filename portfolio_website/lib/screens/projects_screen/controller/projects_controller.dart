import 'package:flutter/material.dart';
import 'package:portfolio_website/model/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsController extends ChangeNotifier {
  final List<Project> projects = [
    Project(
      name: "Bookmark - Schedule app",
      languages: ["Dart", "Flutter", "Serverpod", "PostgreSQL"],
      onPressedGit: "https://github.com/Idanmal8/Bookmarko_frontend_serverpod/tree/main/bookmarko",
      isPrivate: false
    ),
    Project(
      name: "Pokemon Knox app",
      languages: ["Flutter", "Dart"],
      onPressedGit: "https://github.com/Idanmal8/Pokemon_Knox",
      isPrivate: false
    ),
    Project(
      name: "Driver Management app",
      languages: ["Python", "Django", "Flutter", "PostgreSQL", "Private"],
      isPrivate: true,
      onPressedGit: "",
    ),
    Project(
      name: "Commodo CRM system",
      languages: ["Python", "Django", "HTML", "CSS", "JS Vanilla","SSMSQL", "Private"],
      isPrivate: true,
      onPressedGit: "",
    ),
    Project(
      name: "Commodo whatsapp bot",
      languages: ["Python", "Flask", "WhatsApp API", "SSMSQL", "Private"],
      isPrivate: true,
      onPressedGit: "",
    ),
    Project(
      name: "Ai-Therapy - AI chatbot MVP app volenteer",
      languages: ["Flutter", "Dart", "Python", "Flask", "PostgreSQL", "Private"],
      isPrivate: true,
      onPressedGit: "",
    ),
    Project(
      name: "Jump quest - Java game",
      languages: ["Java"],
      isPrivate: false,
      onPressedGit: "https://github.com/Idanmal8/jumpQuestGame",
    ),
  ];


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
}
