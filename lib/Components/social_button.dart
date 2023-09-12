import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Helpers/url_helper.dart';

class SocialButton extends StatelessWidget {
  final SvgPicture icon;
  final Uri url;
  final String socialMedia;

  const SocialButton({
      super.key, 
      required this.icon,
      required this.url,
      required this.socialMedia
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlHelper.launchURLFromUri(url), 
      child: MouseRegion(
        cursor: SystemMouseCursors.click, 
        child: Semantics(
          label: "Link to $socialMedia", 
          child: icon
        )
      )
    );
  }
}