import 'package:curso_flutter_jamilton/navegacao/TelaDois.dart';
import 'package:flutter/material.dart';

class TelaUm extends StatefulWidget {
  const TelaUm({Key? key}) : super(key: key);

  @override
  State<TelaUm> createState() => _TelaUmState();
}

class _TelaUmState extends State<TelaUm> {
  
  String passandoValor = "Alexandre";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("Tela Um"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/naveg-tela-dois', arguments: {
                    'valor': passandoValor
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent
                ),
                child: const Text("Ir para a Tela Dois",
                style: TextStyle(
                  color: Colors.black
                ),)
            ),

          ],
        ),
      ),
    );
  }
}
