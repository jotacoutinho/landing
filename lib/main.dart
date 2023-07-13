import 'package:flutter/material.dart';

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
          createInfoView(),
          createImageView()
        ]
      )
    );
  }

  // Widgets as functions
  // Widget createInfoView() { 
  //   return Flexible(
  //     child: FractionallySizedBox(
  //       widthFactor: 0.5, 
  //       child: Column(
  //         children: [
  //           bio,
  //           // outlinedButton,
  //           // socialContainer
  //         ]
  //       ),
  //     ),
  //   );
  // }

  Widget createInfoView() { 
    return Expanded(
      flex: 1,
      child: bio
    );
  }

  Widget createImageView() { 
    return Expanded(
      flex: 1,
      child: picture
    );
  }

  // Widget createImageView() {
  //   return const Flexible(
  //     child: FractionallySizedBox(
  //     widthFactor: 0.5,
  //     heightFactor: 1,
  //     child: Image(
  //       image: backgroundImage,
  //       fit: BoxFit.cover
  //       ),
  //     ),
  //   );
  // }

// Widget as objects
  Widget bio = Container(margin: EdgeInsets.all(64.0), child: Wrap(
    children: const [
      Text(
        "Hello. I'm an iOS Engineering Manager.",
        style: TextStyle(
          color: primaryColor,
          fontSize: 32,
          fontWeight: FontWeight.bold),
        ),
      // FIXME: There must be a better way to do this spacing
      SizedBox(
        width: 100, 
        height: 100,
      ),
      Text(
        "My name's João Pedro Coutinho. I manage a team of engineers working remotely for many different clients worldwide.",
        style: TextStyle(
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.normal),
        ),
    ],),
  );

  Widget picture = const Image(
    image: backgroundImage,
    height: double.infinity,
    fit: BoxFit.fitHeight,
  );

  Widget outlinedButton = OutlinedButton(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    ),
    onPressed: () { },
    child: 
      const Text('Contact me!'),
    );

    Widget socialContainer = Wrap(
      children: [
        Row(children: [
          const Text(
            "Download",
            style: TextStyle(
            color: primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.normal),
          ),
          TextButton(
            onPressed: () {} ,
            child:
              const Text('my resume'),
            ),
          ],
        )
      ],
    );
}