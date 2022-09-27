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
      appBar: AppBar(
        title: Text("Tela Um"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [

              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaDois(valor: passandoValor)
                        )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent
                  ),
                  child: Text("Ir para a Tela Dois")
              ),

            ],
          ),
        ),
      ),
    );
  }
}
