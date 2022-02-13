import 'package:cool_app/home_page.dart';
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

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void showToast() {
    Fluttertoast.showToast(msg: 'Counter is less than 1', fontSize: 18);
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void decreaseCounter() {
    setState(() {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        print('Counter is less than 1');
        showToast();
      }
    });
  }

  // ignore: non_constant_identifier_names
  final List<Color> _bg_colors = [Colors.greenAccent, Colors.red, Colors.blue];

  TextEditingController _controller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg_colors[_counter % _bg_colors.length],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.asset('assets/flutter_final.png'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Input Username',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Input Password',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.blueGrey,
            ),
            child: MaterialButton(
              onPressed: () {
                print('Username: ' + _controller.text);

                //route to a new Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Press Me'),
            ),
          ),
          const Text('Tapped button this many times'),
          Text(
            '$_counter',
            style: TextStyle(fontSize: 18),
          ),
        ],
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
