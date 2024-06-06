import 'package:d54test1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:d54test1/Database/Manager/accountmanager.dart';
import 'package:permission_handler/permission_handler.dart';

class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {

  @override
  void initState() {
    _permission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.sizeOf(context).height;
    Future.delayed(Duration(seconds: 3), () async {
      var autologin = await SharedPreferences.getInstance();
      if (autologin.getString("autologin") == null ||
          autologin.getString("autologin").toString() == "-1") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage()));
      } else {
        var data = await accountmanager.instance
            .query(autologin.getString("autologin").toString());
        int _id = int.parse(data[0]["id"].toString());
        var _Email = data[0]["account"].toString();
        var _nickname = data[0]["nickname"].toString();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    homepage(Email: _Email, nickname: _nickname, accountid: _id)));
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

  void _permission() async{
    Permission permission = Permission.storage;
    permission.request();
  }
}
