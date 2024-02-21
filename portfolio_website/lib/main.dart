import 'package:flutter/material.dart';
import 'package:portfolio_website/app.dart';

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

void main() async {
  await _init(); 
  runApp(const MyApp());
}
