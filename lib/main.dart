import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AnimatedCrossFadeScreen(),
    );
  }
}


class AnimatedCrossFadeScreen extends StatefulWidget {
  @override
  _AnimatedCrossFadeScreenState createState() => _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  CrossFadeState state = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text("Implicit Animation Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          secondChild: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          crossFadeState: state,
          duration: Duration(seconds:1),
          firstCurve: Curves.easeInToLinear,
          secondCurve: Curves.easeInToLinear,
          sizeCurve: Curves.bounceOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            state = state == CrossFadeState.showFirst?
            CrossFadeState.showSecond:CrossFadeState.showFirst;
          });

        },
        child: Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}