import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/Database/Manager/Datamanager.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class viewpage extends StatefulWidget {
  final String projectname;
  final String username;
  final String password;
  final String URL;
  final String date;


  viewpage({required this.projectname,required this.username,required this.password,required this.URL,required this.date});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  bool _favourite = false;
   late TextEditingController _projectname;
   late TextEditingController _username;
   late TextEditingController _password;
   late TextEditingController _URL;
   late String _date="";
  bool _URLcheck = false;
  var _URLerror = "";
  var _reg = RegExp(r'^(https?:\/\/)?([a-z,A-Z,0-9,-,_]+\.)+[a-z,A-Z]{2,6}$');
  double _val = 0;

  bool _passwordvis = true;

  @override
  void initState() {
    super.initState();
    _projectname = TextEditingController(text: widget.projectname) ;
    _username = TextEditingController(text: widget.username) ;
    _password = TextEditingController(text: widget.password) ;
    _URL = TextEditingController(text: widget.URL) ;
    _date = widget.date;
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text("檢視項目"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "編輯",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ))
        ],
        backgroundColor: Color(0xff009688),
      ),
      body: Center(
        child: Container(
          width: width * 0.8,
          height: height * 0.8,
          child: Column(
            children: [
              TextField(
                // keyboardType: TextInputType.none,。
                enabled: false,
                controller: _projectname,
                decoration: InputDecoration(
                  labelText: "項目名稱",),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Positioned(
                      child:TextField(
                        enabled: false,
                        inputFormatters: [LengthLimitingTextInputFormatter(100)],
                        controller: _username,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "使用者名稱",
                        )
                      ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(onPressed: (){
                        Clipboard.setData(ClipboardData(text: _username.text));
                      }, icon: Icon(Icons.content_copy)))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  TextField(
                    enabled: false,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    controller: _password,
                    obscureText: _passwordvis,
                    decoration: InputDecoration(
                      labelText: "密碼",
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: _password.text));
                          }, icon: Icon(Icons.content_copy))),
                  Positioned(
                      right: 40,
                      height: 40,
                      top: 5,
                      child: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            _passwordvis = false;
                          });
                        },
                        onLongPressUp: () {
                          setState(() {
                            _passwordvis = true;
                          });
                        },
                        child: Icon(_passwordvis
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                enabled: false,
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                controller: _URL,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                    labelText: "網址", errorText: _URLcheck ? _URLerror : null),
                onChanged: (value) {
                  print(_URL.text);
                  print(_reg.hasMatch(value));
                  setState(() {
                    _URLcheck = false;
                  });
                  if (!_reg.hasMatch(_URL.text)) {
                    setState(() {
                      _URLerror = "請輸入正確網址格式";
                      _URLcheck = true;
                    });
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Positioned(
                      child: Container(
                          height: 30,
                          width: width * 0.8,
                          child: Text("建立時間:$_date",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black)))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
