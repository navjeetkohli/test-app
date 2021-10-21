import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_test/cardbrain.dart';
import 'carddata.dart';
import 'dart:ui';
import 'secondScreen.dart';
import 'notification_api.dart';
import 'NavBar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'You wasting your time here!'),
    );
  }
}
List<cardData> cardsData = cardbrain.cardbraindata();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width = 100;
  double _height =  100;

  void _updateState(){
    setState(() {
      _width = 150;
      _height = 150;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                _updateState();
              },
              onLongPress: (){
                if(_width == 150 && _height == 150){
                  setState(() {
                    _width =  100;
                    _height = 100;
                  });
                }
              },
              child: Text('Animate'),
            ),
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                color: Colors.lightGreen,
                child: Text('Animation for no reason!'),
              ),
            ),

            Expanded(
                child: ListView.builder(
                  itemCount: cardsData.length,
                itemBuilder: (BuildContext ctx,int index){
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/${cardsData[index].imgName}',
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            Padding(padding: EdgeInsets.only(left:15 ,right: 15,top: 20,bottom: 20),
                            child: Text('${cardsData[index].data}',
                            style: TextStyle(color: Colors.green[100],fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                                onPressed: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> SecondScreen()));
                            }, child: Text('Read more'))
                          ],
                        ),
                      ),
                    );
                },),),
          ],
        ),
        ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => NotificationApi.showNotifications(
          title: 'Wasting time here',
          body: 'just get lost from here',
          payload: 'lalala.abs',
        ),
        ),
      );
  }
}
// Container(
// margin: EdgeInsets.all(20),
// height: 150,
// child: Positioned.fill(
// child: Image.network(cardsData[index].imgName,
// fit: BoxFit.cover,),
// ),
// );