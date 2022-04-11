import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currencies/constants.dart';
import 'package:currencies/helper_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'list_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appBarTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference curRef = _firestore.collection('04-2022');
    DocumentReference dayRef = curRef.doc('10');
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
      ),
      body: Center(
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
      ),
    );
  }
}
