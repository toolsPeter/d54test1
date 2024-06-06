import 'dart:convert';

import 'package:d54test1/viewpage.dart';
import 'package:d54test1/addpage.dart';
import 'package:d54test1/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d54test1/Database/Manager/Datamanager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  // const homepage({super.key});

  final String Email;
  final String nickname;
  final int accountid;

  homepage({required this.Email, required this.nickname, required this.accountid});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late String _account;
  late String _nickname;
  late int _accountid;

  @override
  void initState() {
    super.initState();
    _account = widget.Email;
    _nickname = widget.nickname;
    _accountid = widget.accountid;
  }

  TextEditingController _search = TextEditingController();

  Widget build(BuildContext context) {
    var _data = datamanager.instance.query(_accountid.toString());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (ctx) => [
                    PopupMenuItem(child: Text("自定排序")),
                    PopupMenuItem(child: Text("依名稱排序")),
                    PopupMenuItem(child: Text("依建立時間排序")),
                  ])
        ],
        backgroundColor: Color(0xff009688),
        title: Text("我的密碼庫"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => addpage(accountid: _accountid)));
          setState(() {});
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff009688),
      ),
      drawer: SafeArea(
        child: Drawer(
          width: width * 0.7,
          child: Scaffold(
              body: Center(
                  child: Stack(
            children: [
              Positioned(
                  top: height * 0.1,
                  width: width * 0.7,
                  child: Center(
                      child: Text(
                    _nickname,
                    style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                  ))),
              Positioned(
                  top: height * 0.2,
                  width: width * 0.7,
                  child: Container(
                      width: width * 0.6,
                      child: Center(
                        child: Text(
                          _account,
                          style: TextStyle(fontSize: 30),
                        ),
                      ))),
              Positioned(
                  width: width * 0.7,
                  top: height * 0.35,
                  child: Center(
                    child: Container(
                        width: width * 0.3,
                        child: ElevatedButton(
                            onPressed: () async{
                              var output =JsonEncoder().convert(await _data);
                              print(output);
                            },
                            child: const Text(
                              "匯出密碼",
                              style: TextStyle(fontSize: 15),
                            ))),
                  )),
              Positioned(
                  width: width * 0.7,
                  top: height * 0.41,
                  child: Center(
                    child: Container(
                        width: width * 0.3,
                        child: ElevatedButton(
                            onPressed: () {
                            },
                            child: const Text(
                              "匯入密碼",
                              style: TextStyle(fontSize: 15),
                            ))),
                  )),
              Positioned(
                  width: width * 0.7,
                  top: height * 0.6,
                  child: Center(
                    child: Container(
                        width: width * 0.3,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (dialog) {
                                    return AlertDialog(
                                      title: const Text("確定登出"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () async{
                                              var autologin =await SharedPreferences.getInstance();
                                              autologin.setString("autologin", "-1");
                                              Navigator.pop(context);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          loginpage()));
                                            },
                                            child: Text("確定")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("取消"))
                                      ],
                                    );
                                  });
                            },
                            child: const Text(
                              "登出",
                              style: TextStyle(fontSize: 15),
                            ))),
                  )),
              Positioned(
                  width: width * 0.7,
                  top: height * 0.7,
                  child: Center(
                    child: Container(
                        width: width * 0.3,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: Text(
                            "刪除帳號",
                            style: TextStyle(fontSize: 15),
                          ),
                        )),
                  )),
            ],
          ))),
        ),
      ),
      body: Stack(children: [
        Positioned(
            top: height * 0.01,
            width: width,
            child: TextField(
              controller: _search,
              onChanged: (value) {
                setState(() {
                  ;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            )),
        Positioned(
            top: height * 0.08,
            height: height * 0.8,
            width: width,
            child: FutureBuilder<List>(
                future: _data,
                builder: (context, listdata) {
                  var favourite = [];
                  var unfavourite = [];
                  var d = [];
                  if(listdata.data!=null){
                  for (int i = 0; i < listdata.data!.length; i++) {
                    if (listdata.data![i]["projectname"]
                        .toString()
                        .contains(_search.text)) {
                      d.add(listdata.data![i]);
                    }
                  }
                  }else{
                    return const Center(
                      child: Text(
                        "目前尚未擁有資料",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }
                  if (d.length == 0) {
                    return const Center(
                      child: Text(
                        "目前尚未擁有資料",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }

                  for (int i = 0; i < d.length; i++) {
                    if (d[i]["favourite"] == 1) {
                      favourite.add(d[i]);
                    } else {
                      unfavourite.add(d[i]);
                    }
                  }

                  return ListView(
                    children: [
                      const ListTile(
                        title: Text("我的最愛",style: TextStyle(fontSize: 13,color: Colors.grey),),
                      ),
                      Divider(color: Colors.black,),
                      for (Map index in favourite)
                        Column(
                          children: [
                            ListTile(
                              title: Text(index["projectname"].toString()),
                              subtitle: Text(index["username".toString()]),
                              onTap: () async{
                                var data = await datamanager.instance.queryview(index["id"]);
                                var projectname = data[0]["projectname"].toString();
                                var username = data[0]["username"].toString();
                                var password = data[0]["password"].toString();
                                var url = data[0]["URL"].toString();
                                var date = data[0]["date"].toString();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpage(projectname: projectname, username: username, password: password, URL: url, date: date)));
                              },
                            ),
                            const Divider(color: Colors.black,),
                          ],
                        ),
                      const ListTile(
                        title: Text("其他項目",style: TextStyle(fontSize: 13,color: Colors.grey),),
                      ),
                      Divider(color: Colors.black,),
                      for (Map index in unfavourite)
                        Column(
                          children: [
                            ListTile(
                              title: Text(index["projectname"].toString()),
                              subtitle: Text(index["username".toString()]),
                              onTap: () async{
                                var data = await datamanager.instance.queryview(index["id"]);
                                var projectname = data[0]["projectname"].toString();
                                var username = data[0]["username"].toString();
                                var password = data[0]["password"].toString();
                                var url = data[0]["URL"].toString();
                                var date = data[0]["date"].toString();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpage(projectname: projectname, username: username, password: password, URL: url, date: date)));
                              },
                            ),
                            const Divider(color: Colors.black,),
                          ],
                        ),
                    ],
                  );
                }))
      ]),
    );
  }
}
//
// void pf() async{
//   var pf = await SharedPreferences.getInstance();
//   pf.setString("keeplogin", "yes");
//   var iskeeplogin = pf.getString("keeplogin");
//   pf.setString("keeplogin", "no");
// }
