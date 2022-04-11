
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'helper_methods.dart';
import 'list_style.dart';

Center Body(DocumentReference<Object?> dayRef) {
    return Center(
      child: Column(
        children: [
          StreamBuilder(
              // What we listen.
              stream: dayRef.snapshots(),
              // What will we do downloaded datas.
              builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
                if (asyncsnapshot.connectionState == // loading progress
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var dataStart = asyncsnapshot.data.data()['00:00'];
                var data = asyncsnapshot.data.data()['15:00'];

                var valuesStart = splitAndBuildArray(dataStart);
                var values = splitAndBuildArray(data);

                return Flexible(
                  child: ListView.builder(
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        return LiStyle(
                                title: titles[index],
                                color: compareValues(values[index],valuesStart[index]) ==
                                        1 // if rising green else red color
                                    ? colorUP
                                    : colorDOWN,
                                value: values[index]);
                      }),
                );
              })
        ],
      ),
    );
  }