import 'package:flutter/material.dart';
import 'package:d54test1/Database/Manager/Datamanager.dart';
import 'package:flutter/services.dart';

class addpage extends StatefulWidget {
  final int id;

  addpage({required this.id});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  bool _favourite = false;
  late int _id;
  TextEditingController _projectname = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _URL = TextEditingController();
  bool _URLcheck = false;
  var _URLerror = "";
  var _reg =RegExp(r'^(https?:\/\/)?([a-z,A-Z,0-9,-,_]+\.)+[a-z,A-Z]{2,6}$');

  bool _passwordvis = true;
  @override
  void initState() {
    super.initState();
    _id = widget.id;
  }

  Widget build(BuildContext context) {
    var width = MediaQuery
        .sizeOf(context)
        .width;
    var height = MediaQuery
        .sizeOf(context)
        .height;

    return Scaffold(
      appBar: AppBar(
        title: Text("新增項目"),
        actions: [
          TextButton(
              onPressed: () {
                datamanager.instance.insurt(_projectname.text, _username.text, _password.text, _URL.text, _favourite?1:0, _id);
              },
              child: Text(
                "儲存",
                style: TextStyle(color: Colors.white, fontSize: 15,),
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
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                controller: _projectname,
                decoration: InputDecoration(hintText: "項目名稱"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                controller:  _username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "使用者名稱"),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  TextField(
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    controller: _password,
                    obscureText: _passwordvis,
                    decoration: InputDecoration(
                      hintText: "密碼",
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.auto_fix_high))),
                  Positioned(
                      right: 40,
                      height: 40,
                      bottom: 0,
                      child: GestureDetector(
                        onLongPress: (){
                          setState(() {
                            _passwordvis =false;
                          });
                        },
                        onLongPressUp: (){
                          setState(() {
                            _passwordvis =true;
                          });
                        },
                        child: Icon(_passwordvis ? Icons.visibility_off:Icons.visibility),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                controller: _URL,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(hintText: "網址",
                errorText: _URLcheck? _URLerror:null),
                onChanged: (value){
                  print(_URL.text);
                    print(_reg.hasMatch(value));
                  setState(() {
                    _URLcheck = false;
                  });
                  if(!_reg.hasMatch(_URL.text)){
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
                          child: Text("我的最愛",style: TextStyle(fontSize: 16, color: Colors.grey[600])))),
                  Positioned(
                    height: 30,
                    right: 0,
                    child: Switch(
                        value: _favourite,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.green[200],
                        onChanged: (value) {
                          setState(() {
                            _favourite = value;
                          });
                        }),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
