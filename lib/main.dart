import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(
        title: 'Flutter is awesome',
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  String title;

  HomeView({required this.title});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _counter = 0;

  void increaseCounter(){
    setState(() {
      _counter++;
    });
  }

  void showToast(){
      Fluttertoast.showToast(msg: 'Counter is less than 1', 
      fontSize: 18);
    }

  void resetCounter(){
    setState(() {
      _counter = 0;
    });
  }

  void decreaseCounter(){
    setState(() {
      if(_counter > 0){
        setState(() {
          _counter--;
        });
      }
      else{
        print('Counter is less than 1');
        showToast();
      }
    });
  }

  List<Color> _bg_colors = [
    Colors.greenAccent,
    Colors.red,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg_colors[_counter % _bg_colors.length],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tapped button this many times'),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => resetCounter(),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => decreaseCounter(),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => increaseCounter(),
          ),
        ],
      ),
    );
  }
}
