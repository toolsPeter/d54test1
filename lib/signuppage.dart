import 'package:d54test1/Database/Manager/accountmanager.dart';
import 'package:d54test1/loginpage.dart';
import 'package:flutter/material.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  @override
  TextEditingController _nickname = TextEditingController();
  TextEditingController _account = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  String _nicknameerrortext = "";
  String _accounterrortext = "";
  String _passworderrortext1 = "";
  String _passworderrortext2 = "";
  bool _nicknameerror = false;
  bool _accounterror = false;
  bool _passworderror1 = false;
  bool _passworderror2 = false;
  bool _sxf = true;
  bool _sxf2 = true;
  var _reg = RegExp(r'\w+@\w+(\.\w+)+$');

  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.sizeOf(context).width;
    var Screenheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Screenheight * 0.1,
              right: Screenwidth * 0.05,
              left: Screenwidth * 0.05,
              child: Text(
                "註冊帳號",
                style: TextStyle(fontSize: 25),
              )),
          Positioned(
              right: Screenwidth * 0.05,
              left: Screenwidth * 0.05,
              top: Screenheight * 0.15,
              child: TextField(
                controller: _nickname,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    errorText: _nicknameerror ? _nicknameerrortext : null,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "暱稱",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              )),
          Positioned(
            right: Screenwidth * 0.05,
            left: Screenwidth * 0.05,
            top: Screenheight * 0.25,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (account) {
                setState(() {
                  _accounterror = false;
                  if (_account.text.isEmpty) {
                    _accounterror = true;
                    _accounterrortext = "請輸入帳號";
                  } else if (_account.text.length > 30) {
                    _accounterror = true;
                    _accounterrortext = "請勿超過30格字元";
                  } else if (!_reg.hasMatch(_account.text)) {
                    _accounterror = true;
                    _accounterrortext = "請輸入正確格式";
                  }
                });
              },
              controller: _account,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                errorText: _accounterror ? _accounterrortext : null,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "帳號(Email)",
              ),
            ),
          ),
          Positioned(
            right: Screenwidth * 0.05,
            left: Screenwidth * 0.05,
            top: Screenheight * 0.35,
            child: TextField(
              onChanged: (password) {
                setState(() {
                  _passworderror1 = false;
                  _passworderror2 = false;
                  if (_password.text.isEmpty) {
                    _passworderrortext1 = "請輸入主密碼";
                    _passworderror1 = true;
                  } else if (_password.text.length > 15) {
                    _passworderrortext1 = "請勿超過15個字元";
                    _passworderror1 = true;
                  }else if (_password.text != _password2.text) {
                    _passworderrortext2 = "您輸入的密碼與主密碼不相符";
                    _passworderror2 = true;
                  }
                });
              },
              controller: _password,
              obscureText: _sxf,
              obscuringCharacter: "*",
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  errorText: _passworderror1 ? _passworderrortext1 : null,
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
                    child: Icon(_sxf ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          Positioned(
            right: Screenwidth * 0.05,
            left: Screenwidth * 0.05,
            top: Screenheight * 0.45,
            child: TextField(
              onChanged: (password2) {
                setState(() {
                  _passworderror2 = false;
                  _passworderror1 = false;
                  if (_password2.text.isEmpty) {
                    _passworderrortext2 = "請輸入確認主密碼";
                    _passworderror2 = true;
                  } else if (_password.text != _password2.text) {
                    _passworderrortext2 = "您輸入的密碼與主密碼不相符";
                    _passworderror2 = true;
                  }
                });
              },
              controller: _password2,
              obscureText: _sxf2,
              obscuringCharacter: "*",
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  errorText: _passworderror2 ? _passworderrortext2 : null,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "確認主密碼",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffix: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _sxf2 = false;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _sxf2 = true;
                      });
                    },
                    child:
                        Icon(_sxf2 ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          Positioned(
              right: Screenwidth * 0.05,
              left: Screenwidth * 0.05,
              top: Screenheight * 0.55,
              height: Screenheight * 0.4,
              child: Center(
                child: Container(
                    width: Screenwidth * 0.25,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_accounterror == false && _passworderror1 == false && _passworderror2 == false) {
                            if (_account.text.isNotEmpty && _password.text.isNotEmpty && _password2.text.isNotEmpty) {
                              var check = await accountmanager.instance.checkaccount(_account.text);
                              if (check == true) {
                                if (_password.text != _password2.text) {
                                  _passworderrortext2 = "您輸入的密碼與主密碼不相符";
                                  _passworderror2 = true;
                                }else{
                                accountmanager.instance.insert(_nickname.text, _account.text, _password.text);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginpage()));
                                }
                              } else if (check == false) {
                                setState(() {
                                  _accounterrortext = "帳號已存在";
                                  _accounterror = true;
                                });
                              }
                            } else {
                              if (_account.text.isEmpty) {
                                setState(() {
                                  _accounterrortext = "請輸入帳號";
                                  _accounterror = true;
                                });
                              }
                              if (_password.text.isEmpty) {
                                setState(() {
                                  _passworderrortext1 = "請輸入主密碼";
                                  _passworderror1 = true;
                                });
                              }
                              if (_password2.text.isEmpty) {
                                _passworderrortext2 = "請輸入確認主密碼";
                                _passworderror2 = true;
                              }
                            }
                          } else {
                            print("error");
                          }
                        },
                        child: Text(
                          "註冊",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ))),
              )),
        ],
      ),
    );
  }
}
