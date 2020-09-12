import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer _timer;
  DateTime now;
  int ms = 0;
  var formatter = DateFormat('HH:mm:ss');

  var loading = true;

  void initState() {
    // TODO: implement initState
    super.initState();
//    var now = DateTime.now();
  }

  String getTime() {
    loading = false;
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        loading = false;
        now = DateTime.now();
      });
    });
    return formatter.format(now);
  }

  String getMiles(){
    loading = false;
    const period = const Duration(milliseconds: 800);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        if(ms < 90){
          ms += 12;
        }
        else{
          ms = 00;
        }

      });
    });
    return ms.toString();
  }

  String changeLoading(){
    loading = false;
    if(loading == false){
      return "${getTime()}:${getMiles()}";
    }
    else{
      return "";
    }
  }
  var showCode1 = false;
  var showCode2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "桂电畅行证",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.grey[200],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16.0),
                          child: Text(
                            "东区检查点",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height*0.9,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                /////////////////////////时间////////////////////
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    "${changeLoading()}",
                                    style: TextStyle(
                                        fontSize: 23, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      height: MediaQuery.of(context).size.width * 0.25,
                                      child: Image.asset("images/code2.JPG")),
                                ),
                                Text(
                                  "*飞可以通行",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "您的信息已经提交给相关的检查员",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showCode1 = true;
                                              showCode2 = false;
                                            });
                                            print(showCode1);
                                          },
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                            height: 30,
                                            decoration: new BoxDecoration(
                                              border: new Border.all(
                                                  color: Colors.green, width: 1),
                                              shape: BoxShape.rectangle,
                                              color: showCode1 == true
                                                  ? Colors.white
                                                  : Colors.green,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "桂林畅行健康码",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: showCode1 == true
                                                        ? Colors.green
                                                        : Colors.white),
                                              ),
                                            ),
//
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showCode2 = true;
                                            showCode1 = false;
                                          });
                                          print(showCode1);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width *
                                              0.35,
                                          height: 30,
                                          decoration: new BoxDecoration(
                                            border: new Border.all(
                                                color: Colors.green, width: 1),
                                            shape: BoxShape.rectangle,
                                            color: showCode2 == true
                                                ? Colors.white
                                                : Colors.green,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "广西健康码",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: showCode2 == true
                                                      ? Colors.green
                                                      : Colors.white),
                                            ),
                                          ),
//                                      color: Colors.blue,
//
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: MediaQuery.of(context).size.width * 0.6,
                                  child: Image.asset("images/code.JPG"),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.green,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("可通行"),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.orange,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("限制通行"),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("不可通行"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: 45,
                        child: FlatButton(
                          color: Colors.white,
//                        highlightColor: Colors.blue[700],
//                        colorBrightness: Brightness.dark,
//                        splashColor: Colors.grey,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          child: Text("返回首页"),
//                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () => {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: 45,
                        child: FlatButton(
                          color: Colors.white,
//                        highlightColor: Colors.blue[700],
//                        colorBrightness: Brightness.dark,
//                        splashColor: Colors.grey,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          child: Text("出行记录"),
//                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
