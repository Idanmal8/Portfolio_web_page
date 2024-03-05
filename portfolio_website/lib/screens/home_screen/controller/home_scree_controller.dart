import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class HomeScreenController extends ChangeNotifier {
  //launch mailto

  Future<void> goToMail() async {
    final mailtoLink = Mailto(
      to: ['Idanmalkadb@gmail.com'],
      cc: [],
      subject: 'Idan, Lets talk!',
      body: 'Hey Idan, I would like to talk to you about...',
    );
    await launchUrl(Uri.parse(mailtoLink.toString()));
  }
}
