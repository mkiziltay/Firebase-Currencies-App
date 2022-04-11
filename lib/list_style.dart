
import 'package:flutter/material.dart';

class LiStyle extends StatelessWidget {

  Color color; final String title; String value;

  LiStyle({
    Key? key,
    required this.title, required this.color, required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                height: 65,
                color: Colors.amber.shade100,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(width: 25),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          value,
                          style: TextStyle(
                              color: color,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
