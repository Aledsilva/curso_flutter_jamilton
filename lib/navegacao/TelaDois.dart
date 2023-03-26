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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Tela Dois"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Tela Dois!! ${widget.valor.toString()}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
            )

          ],
        ),
      ),
    );
  }
}
