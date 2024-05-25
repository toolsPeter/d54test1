import 'package:d54test1/main.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/loginpage.dart';

class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.sizeOf(context).height;
    var screenwidth = MediaQuery.sizeOf(context).width;
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage()));
      }
    });
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: screenheight * 0.5 - 50,
                child: Column(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.grey[800],
                      size: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "我的密碼庫",
                      style: TextStyle(fontSize: 45),
                    )
                  ],
                )),
          ],
        ));
  }
}
