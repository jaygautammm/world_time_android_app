import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'dayBG.jpg' : 'nightBG.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.blue[200] : Colors.grey[900];
    Color? textColor1 = data['isDaytime'] ? Colors.blueGrey[800] : Colors.white70;
    Color? textColor2 = data['isDaytime'] ? Colors.blueGrey[800] : Colors.grey[900];
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, height*0.15, 0.0, 0.0),
              child: Column(
                  children: <Widget> [
                    TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: textColor1,
                        size: 25.0,
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                            color: textColor1,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            data['location'],
                                style: TextStyle(
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  color: textColor2,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: textColor2,
                    ),),
                  ]
              ),
            ),
          ),
      ),
    );
  }
}
