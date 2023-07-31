import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(const MyApp());
}
  
const primaryColor = Color.fromARGB(255, 223, 183, 119);
const backgroundColor = Color.fromARGB(244, 8, 43, 84);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jota',
      home: Scaffold(body: MyHomePage(title: 'João Pedro Coutinho')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  static const backgroundImage = AssetImage('backgroundImage.JPG');

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: double.infinity,
      child: Row(
        children: [
          infoView(),
          imageView()
        ]
      )
    );
  }

  // To adjust the layout depending on device running the app
  Future<bool> _isRunningOnMobile() async {
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
      return true;
    }
  }

  // Informational View
  Widget infoView() { 
    return Expanded(
      flex: 1,
      child: bio()
    );
  }

  Widget bio() {
    return Container(margin: const EdgeInsets.all(64.0), child: Wrap(
      children: [
        const Text(
          "Hello. I'm an iOS Engineering Manager.",
          style: TextStyle(
            color: primaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 100),
        const Text(
          "My name's João Pedro Coutinho. I manage a team of software engineers working remotely all over the world.",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 150),
          outlinedButton(),
          const SizedBox(height: 150),
          socialContainer(),
      ],),
    );
  } 

  Widget outlinedButton() { 
    return OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            minimumSize: const Size(250, 50),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            side: const BorderSide(color: primaryColor)
          ),
          onPressed: () { 
            // TODO: mailto
          } ,
          child: 
            const Text("Let's work together!", style: TextStyle(fontSize: 18.0)),
        );
  }

  Widget socialContainer() {
    return Wrap(
      children: [
        Row(children: [
          const Text("Download", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.normal)),
          TextButton(
            onPressed: () {
              // TODO: download PDF
            },
            child: const Text('my resume', style: 
              TextStyle(
                color: Colors.white, 
                fontSize: 14, 
                fontWeight: FontWeight.normal, 
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1.0))
          ),
          const Text("(PDF 1.08MB)", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.normal)),
        ],),
      ],
    );
  } 

  // Image View
  Widget imageView() { 
    return Expanded(
      flex: 1,
      child: picture
    );
  }

  Widget picture = const Image(
    image: backgroundImage,
    height: double.infinity,
    fit: BoxFit.fitHeight,
  );
}