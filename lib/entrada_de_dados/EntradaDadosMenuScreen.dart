import 'package:flutter/material.dart';


class EntradaDadosMenuScreen extends StatefulWidget {
  const EntradaDadosMenuScreen({Key? key}) : super(key: key);

  @override
  State<EntradaDadosMenuScreen> createState() => _EntradaDadosMenuScreenState();
}

class _EntradaDadosMenuScreenState extends State<EntradaDadosMenuScreen> {

  Widget botaumRapidaum(String nomeDoBotao, String nomeDaRota){

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, padding: const EdgeInsets.all(30)),
          onPressed: () {
            Navigator.pushNamed(context, nomeDaRota);
          },
          child: Text(
            nomeDoBotao,
            style: const TextStyle(fontSize: 18),
          )),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Entrada de Dados Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            botaumRapidaum("Campos de Texto", '/campo-de-texto'),
            botaumRapidaum("CheckBox", '/entrada-checkbox'),
            botaumRapidaum("Radio Button", '/entrada-radio-button'),
            botaumRapidaum("Slider", '/entrada-slider'),
            botaumRapidaum("Switch", '/entrada-switch'),
          ],
        ),
      ),
    );
  }
}
