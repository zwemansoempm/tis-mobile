import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:tis/screens/main_screen.dart';
import 'package:tis/views/top.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:ui' as ui;
// import 'package:tis/views/home.dart';


void main() {
  runApp(DevicePreview(     
    builder: (context)=>MyApp(),
    enabled:!kReleaseMode,
  ) );
   
}

class MyApp extends StatelessWidget {
  // MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder, // <--- /!\ Add the builder
      title: 'TIS Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        // primarySwatch: Colors.blue,        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashPage(),//TopPage(), MainScreen
      // HomePage(),
      
    );
  }
}
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new TopPage(),
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
      image: new Image.asset('assets/images/logo.PNG'),     //network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.greenAccent,
    );
  }
}
