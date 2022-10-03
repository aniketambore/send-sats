import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_webln/flutter_webln.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _isWallet = false;

  bool get isInitialized => _initialized;
  bool get isWallet => _isWallet;
  String get noWalletMssg =>
      'To use this website, you must first enhance your browser with WebLN functionality by installing an extension.';

  void initializeApp() {
    checkWebln();
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void checkWebln() {
    try {
      final weblnValue = weblnDecode(FlutterWebln.webln);
      if (weblnValue.isEmpty) {
        _isWallet = false;
      } else {
        _isWallet = true;
      }
      print('[+] WebLN value is $weblnValue');
    } catch (error) {
      print('[!] Error is $error');
    }
  }
}
