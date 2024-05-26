// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/Database/Manager/Datamanager.dart';

class addpage extends StatefulWidget {
  // const addpage({super.key});
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
                maxLength: 100,
                controller: _projectname,
                decoration: InputDecoration(hintText: "項目名稱"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLength: 100,
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
                maxLength: 100,
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
                      height: 50,
                      child: GestureDetector(
                        onLongPress: (){
                          setState(() {
                            _passwordvis =!_passwordvis;
                          });
                        },
                        onLongPressUp: (){
                          setState(() {
                            _passwordvis =!_passwordvis;
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
                maxLength: 100,
                controller: _URL,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(hintText: "網址"),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    height: 30,
                    width: width * 0.8,
                    child: Positioned(
                      left: 0,
                      child: Text(
                        "我的最愛",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ),
                  ),
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
              ElevatedButton(onPressed: () {
                datamanager.instance.query(_projectname.text);
              }, child: Text("ppppppx"))
            ],
          ),
        ),
      ),
    );
  }
}
