import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

///Check internet connection
Future<bool> isInternetConnected() async {
  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  } on PlatformException catch (_) {
    return false;
  }
}