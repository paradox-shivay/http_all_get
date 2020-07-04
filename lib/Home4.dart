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
      home: Home4(),
    );
  }
}
//
class Home4 extends StatefulWidget {
  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4> {

  @override
  Widget build(BuildContext context) {
    final apiservice = RestApiGet();
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Reports'),
      ),
      body: FutureBuilder(
        future: apiservice.getData(),
        builder: (BuildContext context, snapshot) {
          var coData = snapshot.data;
          if (coData == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            var loopData = coData["data"];
            return ListView.builder(
              itemCount: loopData == null ? 0 : loopData.length  ,
              itemBuilder: (BuildContext context, int index) {
                if (loopData == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else {
                  return
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(loopData[index]["avatar"]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                ("${loopData[index]["first_name"]}  ${loopData[index]["last_name"]}")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(("${loopData[index]["email"]}")),
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
}
