import 'package:flutter/material.dart';
import 'RestApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home3(),
    );
  }
}
//
class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  var dataFromAPI;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Reports'),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, snapshot) {
          var coData = snapshot.data;
          if (coData == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: coData == null ? 0 : coData.length  ,
              itemBuilder: (BuildContext context, int index) {
                if (coData == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else {return
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(coData[index]["avatar"]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                ("${coData[index]["first_name"]}  ${coData[index]["last_name"]}")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(("${coData[index]["email"]}")),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  _getData() async {
    final result = await RestApiGet().getData();
    setState(() {
      dataFromAPI = result['data'];
    });
    return dataFromAPI;
  }

}
