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
      home: Home2(),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var dataFromAPI;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var userData = dataFromAPI;
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Reports'),
      ),
      body:  ListView.builder(
        itemCount: userData == null ? 0 : userData.length  ,
        itemBuilder: (BuildContext context, int index) {
          if (userData == null) {
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
                      backgroundImage: NetworkImage(userData[index]["avatar"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          ("${userData[index]["first_name"]}  ${userData[index]["last_name"]}")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(("${userData[index]["email"]}")),
                    ),
                  ],
                ),
              ),
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