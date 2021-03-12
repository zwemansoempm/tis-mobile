import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tis/views/top.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:ui' as ui;


// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
   _enablePlatformOverrideForDesktop();
   
  runApp(
   const MyApp(),
  //   DevicePreview(     
  //   builder: (context)=>MyApp(),
  //   enabled:!kReleaseMode,
  // )
  );   
}

class MyApp extends StatelessWidget { 
  const MyApp();
  // MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    
    return MaterialApp(
      // locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      // builder: DevicePreview.appBuilder, // <--- /!\ Add the builder
      title: 'TIS Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        // primarySwatch: Colors.blue,        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:const SplashPage(),//TopPage(), MainScreen
      // HomePage(),      
    );
  }

}
class SplashPage extends StatelessWidget { 
  const  SplashPage();

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: const TopPage(),
      title: new Text('TIS NEWS',style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        foreground: Paint()
        ..shader = ui.Gradient.linear(
        const Offset(0, 20),
        const Offset(150, 20),
        <Color>[
          Colors.redAccent,
          Colors.yellow[300],
        ],
      )
      ),textScaleFactor: 2,),
      image: new Image.asset('assets/img/logo.PNG'),     
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.greenAccent,
    );
  }
}
