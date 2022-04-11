import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'list_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currencies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
        title: Text('Currencies'),
        centerTitle: true,
      ),
      body: //LiStyle(title: 'USD/TRY',value: '14.8485',color: Colors.red,),
          Center(
        child: Column(
          children: [
            /*ElevatedButton(
                onPressed: () async {
                  var response = await dayRef.get();

                  print(response.data().toString());
                  print(response['imdb']);

                  var response2 = await curRef.get();
                  var list = response2.docs;
                  print(list[1].data());

                  
                },
                child: Text('get Data')),*/
            StreamBuilder(
                // What we listen.
                stream: dayRef.snapshots(),
                // What will we do downloaded datas.
                builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
                  var dataStart = asyncsnapshot.data.data()['00:00'];
                  var data = asyncsnapshot.data.data()['15:00'];

                  var valuesStart = _splitAndBuildArray(dataStart);
                  var values = _splitAndBuildArray(data);
                  var titles = [
                    'USD/TRY',
                    'EUR/TRY',
                    'AUD/TRY',
                    'GBP/TRY',
                    'JPY/TRY',
                    'CHF/TRY',
                    'CAD/TRY',
                    'NOK/TRY',
                    'EUR/USD',
                    'EUR/GBP',
                    'EUR/JPY',
                    'GBP/USD',
                    'USD/AUD',
                    'USD/JPY',
                    'USD/CHF',
                    'USD/CAD',
                    'USD/CNY'
                  ];
                  return Flexible(
                    child: ListView.builder(
                        itemCount: values.length,
                        itemBuilder: (context, index) {
                          return LiStyle(
                              title: titles[index],
                              color: _compareValues(values[index], valuesStart[index]) == 1 ? Colors.green : Colors.red,
                              value: values[index]);
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }

  List<String> _splitAndBuildArray(String value) {
    var splitted = value.split(',');
    return splitted;
  }

  int _compareValues(String a, String b) {
    double valA = double.parse(a);
    double valB = double.parse(b);
    if (valA >= valB) return 1;
    return 0;
  }
}


