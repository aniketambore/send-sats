import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
