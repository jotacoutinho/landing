import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

class DeviceManagerHelper {
  static Future<bool> isRunningOnMobile() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      
      if(androidInfo.androidId.isNotEmpty || iosInfo.identifierForVendor.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      // Defaults to mobile experience because it's less likely to break the layout
      return false;
    }
  }
}