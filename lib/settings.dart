import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

bool darkMode = true;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Settings",
          style: TextStyle(color: darkMode ? Colors.white : Colors.black,
            fontSize: 28,
//              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: darkMode ? Color(0xFF161616) : Colors.grey[100],
      ),
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(11.5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dark mode",
                            style: TextStyle(
                              color: darkMode ? Colors.white : Colors.black,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(width: 185,),
                          ShaderMask(
                            child: CupertinoSwitch(
                              activeColor: Colors.orange,
                              value: darkMode,
                              onChanged: (v) => setState(() => darkMode = v),
                            ),
                            shaderCallback: (r) {
                              return LinearGradient(
                                colors: darkMode
                                    ? [Colors.white, Colors.orange]
                                    : [Colors.white, Colors.white],
                              ).createShader(r);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(14.5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Privacy policy",
                        style: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Text(
                    "This app doesn't store data, period. It physically can't. "
                    "It has nowhere to store it. It doesn't even have a server "
                    "database to store it. So even if Kanye West asked nicely "
                    "to see your data, there is nothing to show him.",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
      backgroundColor: darkMode ? Colors.black : Colors.white,
    );
  }
}
