import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  @override
  bool _swictch = false;

  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text("新增項目"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "儲存",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff009688),
      ),
      body: Center(
        child: Container(
          width: width * 0.8,
          height: height * 0.8,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "項目名稱"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "使用者名稱"),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "密碼",
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.auto_fix_high))),
                  Positioned(
                      right: 35,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.visibility_off)))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
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
                        value: _swictch,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.green[200],
                        onChanged: (value) {
                          setState(() {
                            _swictch = value;
                          });
                        }),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
