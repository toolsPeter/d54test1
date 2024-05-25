import 'package:d54test1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/Database/Manager/accountmanager.dart';
import 'package:d54test1/signuppage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController _account = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _sxf = true;
  @override

  Widget build(BuildContext context) {
    var screenheight = MediaQuery.sizeOf(context).height;
    var screenwidgh = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: screenheight * 0.15,
              child: Column(
                children: [
                  Icon(
                    Icons.lock,
                    size: 150,
                    color: Colors.grey[800],
                  ),
                  Text(
                    "歡迎使用",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[800]),
                  ),
                  Text(
                    "我的密碼庫",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[800]),
                  ),
                ],
              )),
          Positioned(
              top: screenheight * 0.5,
              child: Column(
                children: [
                  Container(
                    width: screenwidgh * 0.8,
                    child: TextField(
                      controller: _account,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "帳號(Email)",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenwidgh * 0.8,
                    child: TextField(
                      controller: _password,
                      obscureText: _sxf,
                      obscuringCharacter: "*",
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "主密碼",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffix: GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _sxf = false;
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                _sxf = true;
                              });
                            },
                            child: Icon(
                                _sxf ? Icons.visibility_off : Icons.visibility),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: screenwidgh * 0.8,
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenwidgh * 0.1,
                        ),
                        Container(
                          width: screenwidgh * 0.25,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                var _passwordcheck = await accountmanager
                                    .instance
                                    .query(_account.text);
                                if (_passwordcheck[0]["password"].toString() == _password.text) {
                                  var nickname = _passwordcheck[0]["nickname"].toString();
                                  var id = int.parse(_passwordcheck[0]["id"].toString());
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage(Email:_account.text,nickname: nickname,id: id,)));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("登入失敗"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("確定"))
                                          ],
                                        );
                                      });
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("登入失敗"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("確定"))
                                        ],
                                      );
                                    });
                              }
                            },
                            child: Text(
                              "登入",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenwidgh * 0.1,
                        ),
                        Container(
                          width: screenwidgh * 0.25,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[350]),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Contexr) => signuppage()));
                              },
                              child: Text(
                                "註冊帳號",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}