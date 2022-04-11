
import 'package:currencies/constants.dart';
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
                height: 55,
                color: bgColor.shade100,
                child: Row(
                  children: [
                    Padding(
                        padding: padding_5,
                        child: Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: circular,
                          ),
                        )),
                    Padding(
                        padding: padding_15,
                        child: Text(
                          title,
                          style: mainStyle,
                        )),
                        SizedBox(width: 25),
                    Padding(
                        padding: padding_5,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: color,
                              fontSize: 32,
                              fontWeight: bold),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
