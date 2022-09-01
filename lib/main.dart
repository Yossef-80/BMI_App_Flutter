import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_for_training/result.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

 main()=>runApp( MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {

     return  MaterialApp(
        debugShowCheckedModeBanner: false,
       theme: ThemeData(primarySwatch: Colors.blue,
              canvasColor: Colors.black,
              iconTheme: const IconThemeData(size:55 ,color: Colors.white),
              textTheme: const TextTheme(
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ), headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                fontWeight: FontWeight.bold
                )
              ),
       ),

        home:const HomePage(),

     );


  }
}
