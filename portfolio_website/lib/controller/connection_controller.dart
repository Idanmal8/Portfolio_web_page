import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class ConnectionController extends ChangeNotifier {
  ConnectionController() {
    hasInternetConnection();
  }

  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        notifyListeners();
        return false;
      }
    } on SocketException catch (_) {
      notifyListeners();
      debugPrint('$_');
      return false;
    }
    notifyListeners();
    return true;
  }
}
