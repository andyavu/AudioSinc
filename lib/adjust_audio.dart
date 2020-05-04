import "dart:async";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "settings.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  static const platform = const MethodChannel("booni.platform");
  bool startPressed = false;

//  Future<void> _getButtonPress() async {
//    bool button;
//    try {
//      final int result = await platform.invokeMethod("getButtonPress");
//      button = true;
//    } on  PlatformException catch(e) {
//      button = false;
//    }
//
//    setState(() {
//      startPressed = button;
//    });
//  }

  double seconds = 0;

  String displayOp() {
    if(seconds < 0) {
      return "Delay Audio By";
    }
    else if(seconds > 0) {
      return "Advance Audio By";
    }
    else {
      return "Normal Audio";
    }
  }

  String displaySec() {
    return seconds.abs().toStringAsFixed(2);
  }

  void increment() {
    setState(() {
      seconds += 0.05;
    });
  }

  void decrement() {
    setState(() {
      seconds -= 0.05;
    });
  }

  void reset() {
    setState(() {
      seconds = 0;
      startPressed = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adjust Latency Offset",
          style: TextStyle(color: darkMode ? Colors.white : Colors.black,
            fontSize: 28,
//              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: darkMode ? Color(0xFF161616) : Colors.grey[100],
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10,),
          Text(displayOp(), style: TextStyle(
            color: darkMode ? Colors.white70 : Colors.black,
            fontSize: 25,),
          ),
          SizedBox(height: 13,),
          Text(displaySec() + " sec",
            style: TextStyle(
              color: darkMode ? Colors.white : Colors.black,
              fontSize: 55,
            ),
          ),
          SizedBox(height: 75,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        decrement();
                      },
                      child: ClipOval(
                        child: Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
//                            color: Colors.white12,
                            border: Border.all(color: Colors.orange,
                                width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                          ),
                          child: Center(
                            child: Text("–", style: TextStyle(
                              color: Colors.orange,
                              fontSize: 40,
//                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Delay", style: TextStyle(
                        color: darkMode ? Colors.white70 : Colors.black,
                        fontSize: 14),
                    ),
                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          reset();
                        },
                        child: ClipOval(
                          child: Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
//                                color: Colors.white12,
                                border: Border.all(color: Colors.orange,
                                    width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    90)),
                              ),
                              child: Center(
                                child: Text("↺\n", style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                              )
                          ),
                        )
                    ),
                    Text(
                      "Reset", style: TextStyle(
                        color: darkMode ? Colors.white70 : Colors.black,
                        fontSize: 14),
                    ),
                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          increment();
                        },
                        child: ClipOval(
                          child: Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange,
                                    width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    90)),
                              ),
                              child: Center(
                                child: Text("+", style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 40,
//                                    fontWeight: FontWeight.bold
                                ),
                                ),
                              )
                          ),
                        )
                    ),
                    Text(
                      "Advance", style: TextStyle(
                        color: darkMode ? Colors.white70 : Colors.black,
                        fontSize: 14),
                    ),
                  ]
              ),
            ],
          ),
          SizedBox(height: 90,),
          RaisedButton(
            child: Text(startPressed ? "Stop" : "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
              ),
            ),
            elevation: 5.0,
//            onPressed: _getButtonPress,
            onPressed: () {
              setState(() {
                startPressed = !startPressed;
              });
            },
            color: Colors.orange,
            padding: startPressed ? EdgeInsets.fromLTRB(62, 20, 62, 20) : EdgeInsets.fromLTRB(60, 20, 60, 20),
          ),
          SizedBox(height: 40,),
        ],
      ),
      backgroundColor: darkMode ? Colors.black : Colors.white,
    );
  }
}
