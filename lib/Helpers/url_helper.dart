import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlHelper {
  static Future<void> launchURLFromUri(Uri url) async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
  }

  static Future<void> launchURLFromString(String urlString) async {
    final assetUrl = Uri.base.resolve(urlString).toString();
    launchUrlString(assetUrl);
  }
}