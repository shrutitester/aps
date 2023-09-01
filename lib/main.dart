import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screen/loginPage.dart';
import 'package:untitled1/screen/orderNewEntryScreen/checkboxes.dart';
import 'package:untitled1/screen/splashScreen.dart';
import 'package:untitled1/route/routes.dart' as route;
import 'constants/colorConstants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: ScreenUtilInit(
          designSize: Size(360, 690),
          builder: (context,child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Anapurna Sales',
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: ColorConstants.primaryColor,
              secondaryHeaderColor: ColorConstants.primaryColor,
              appBarTheme: AppBarTheme(color:ColorConstants.primaryColor),
              // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF4A52)),
              useMaterial3: true,
            ),
            onGenerateRoute: (settings) => route.controller(settings),
            initialRoute: route.myHomePage,
            // home: const MyHomePage(),
          )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }

  void requestPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      debugPrint('Permission grant');
    } else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      debugPrint('Permission provisional');
    } else {
      debugPrint('Permission declined');
    }
  }
}
