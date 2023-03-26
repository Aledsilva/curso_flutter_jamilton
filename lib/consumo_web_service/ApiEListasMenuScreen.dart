import 'package:flutter/material.dart';

class ApiEListasMenuScreen extends StatefulWidget {
  const ApiEListasMenuScreen({Key? key}) : super(key: key);

  @override
  State<ApiEListasMenuScreen> createState() => _ApiEListasMenuScreenState();
}

class _ApiEListasMenuScreenState extends State<ApiEListasMenuScreen> {

  Widget _meuBotaumRapidaum(String nomeDoBotao, String nomeDaRota){

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
        title: const Text("Executando Mídias"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            _meuBotaumRapidaum('Consumo Web Service', '/consumo-web'),
            _meuBotaumRapidaum('Consumo Web Service Avançado', '/consumo-web-avancado'),
            _meuBotaumRapidaum('Listas', '/listas'),
            _meuBotaumRapidaum('Listas COM Api', '/listas-com-api'),

          ],
        ),
      ),
    );
  }
}
