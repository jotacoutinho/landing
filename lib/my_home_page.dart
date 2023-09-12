import 'package:flutter/material.dart';
import 'Theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Helpers/url_helper.dart';
import 'Components/circular_icon.dart';
import 'Components/social_button.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  static const AssetImage backgroundImage = AssetImage('backgroundImage.png');
  final String title;
  bool isRunningOnMobile = false;
  static const imageSemanticLabel = "Picture of me with a joyful expression, smiling, looking slightly to the left. I have silver hair, brown eyes, and I'm wearing a black T-shirt that reads `Sorry I'm late`.";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    isRunningOnMobile = screenSize.width < screenSize.height;

    return Container(
      color: secondaryColor,
      height: double.infinity,
      child: getRootWidgetAccordingToDevice()
    );
  }

  // Widgets
  Widget getRootWidgetAccordingToDevice() {
    if (isRunningOnMobile) {
      return Column(children: [imageView(), infoView()]);
    } else {
      return Row(children: [infoView(), imageView()]);
    }
  }

  Widget infoView() { 
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(scrollDirection: Axis.vertical, child: bio())
    );
  }

  Widget imageView() {
    if (isRunningOnMobile) {
      return const Expanded(flex: 1, child: Image(image: backgroundImage, fit: BoxFit.fitWidth, width: double.infinity, semanticLabel: imageSemanticLabel));
    } else {
      return const Expanded(flex: 1, child: Image(image: backgroundImage, fit: BoxFit.cover, height: double.infinity, width: double.infinity, semanticLabel: imageSemanticLabel));
    }
  }

  Widget bio() {
    return Container(margin: const EdgeInsets.all(64.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularIcon(backgroundColor: primaryColor, icon: SvgPicture.asset('assets/briefcase.svg', width: 40, height: 40, color: secondaryColor), iconSize: 50),
        const SizedBox(height: 100),
        const Text(
          "Hello. I'm an iOS Engineering Manager.",
          style: TextStyle(
            color: primaryColor,
            fontSize: 36,
            fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 50),
        const Text(
          "My name's João Pedro Coutinho. I manage a team of software engineers working remotely all over the world.",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 100),
          outlinedButton(),
          const SizedBox(height: 200),
          linksContainer(),
      ],),
    );
  } 

  Widget outlinedButton() { 
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        minimumSize: const Size(250, 60),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        side: const BorderSide(color: primaryColor)
      ),
      onPressed: () { 
        _sendEmail();
      } ,
      child: 
        const Text("Let's work together!", style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget linksContainer() {
    return Column(children: [
      socialButtons(),
      downloadResume(),
    ]);
  } 

  Widget socialButtons() {
    return Row(children: [
      SocialButton(
        icon: SvgPicture.asset('assets/logo-linkedin.svg', width: 40, height: 40, color: primaryColor),
        url: Uri.parse("https://www.linkedin.com/in/jo%C3%A3o-pedro-de-souza-coutinho-b9440082/"),
        socialMedia: "Linkedin",
      ),
      const SizedBox(width: 8),
      SocialButton(
        icon: SvgPicture.asset('assets/logo-github.svg', width: 40, height: 40, color: primaryColor),
        url: Uri.parse("https://github.com/jotacoutinho"),
        socialMedia: "Github",
      ),
    ]);
  }

  Widget downloadResume() {
    return Row(children: [
      const Text("Download", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.normal)),
      TextButton(
        onPressed: () { openPdfInNewTab(); },
        child: const Text('my resume', style: 
          TextStyle(
            color: Colors.white, 
            fontSize: 14, 
            fontWeight: FontWeight.normal, 
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationThickness: 1.0))
      ),
      const Text("(PDF)", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.normal)),
    ]);
  }

  // Functions
  void openPdfInNewTab() {
    const String assetPath = 'assets/jota-cv.pdf';
    UrlHelper.launchURLFromString(assetPath);
  }

  void _sendEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: 'jpscoutinho94@gmail.com',
      query: 'subject=Let%27s%20work%20together%21', // Customize the subject and body
    );

    UrlHelper.launchURLFromUri(emailUri);
  }
}