import 'package:flutter/material.dart';

class TelaDois extends StatefulWidget {

  String valor;

  TelaDois({Key? key, required this.valor}) : super(key: key);

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Dois"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [

              Text("Tela Dois!! ${widget.valor.toString()}")

            ],
          ),
        ),
      ),
    );
  }
}
