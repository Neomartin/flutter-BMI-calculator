import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child:  Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Colors.pinkAccent)),
              Expanded(child: ReusableCard(colour: Colors.lightGreenAccent))
            ],
          )),
          Expanded(child:  Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Colors.blueAccent),),
            ],
          )),
          Expanded(child:  Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Colors.tealAccent)),
              Expanded(child: ReusableCard(colour: Colors.red))
            ],
          ))
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                accentColor: Colors.purple
            )
        ),
        child: const FloatingActionButton(
          onPressed: null,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  const ReusableCard({this.colour = const Color(0xFF1D1E33), super.key});


  // ReusableCard({ }))
  // final Color colour;
  // ReusableCard({final this.colour = Color(0xFF1D1E33) })
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}