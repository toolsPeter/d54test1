import 'package:d54test1/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/startpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          drawerTheme: DrawerThemeData(scrimColor: Color(0x00000000))),

      // home: const startpage(),
      home: const startpage(),
    );

  }
}
