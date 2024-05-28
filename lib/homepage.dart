import 'package:d54test1/addpage.dart';
import 'package:d54test1/loginpage.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  // const homepage({super.key});

  final String Email;
  final String nickname;
  final int id;

  homepage({required this.Email, required this.nickname,required this.id});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late String _account;
  late String _nickname;
  late int _id;

  @override
  void initState() {
    super.initState();
    _account = widget.Email;
    _nickname = widget.nickname;
    _id = widget.id;
  }

  Widget build(BuildContext context) {
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addpage(id: _id)));
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
                            onPressed: () {},
                            child: Text(
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
                            onPressed: () {},
                            child: Text(
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
                                      title: Text("確定登出"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginpage()));
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
                            child: Text(
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
                          child: Text(
                            "刪除帳號",
                            style: TextStyle(fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
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
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ))
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
