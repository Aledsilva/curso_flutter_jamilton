import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumoServicoWeb extends StatefulWidget {
  const ConsumoServicoWeb({Key? key}) : super(key: key);

  @override
  State<ConsumoServicoWeb> createState() => _ConsumoServicoWebState();
}

class _ConsumoServicoWebState extends State<ConsumoServicoWeb> {

  final TextEditingController _controllerCep = TextEditingController();

  String _resultado = "Resultado";

  _recuperarCep() async {
    String cepDigitado = _controllerCep.text;
    String url = "https://viacep.com.br/ws/$cepDigitado/json/";

    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "$logradouro, $bairro, $localidade";
    });

    // print("resposta logradouro: ${logradouro}");
    // print("resposta: " + response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo Serviço Web"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o cep: ex: 01000-010"
              ),
              style: const TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,
            ),
            ElevatedButton(
                onPressed: _recuperarCep,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue
                ),
                child: const Text("Clique aqui!")
            ),
            Text(_resultado),

          ],
        ),
      ),
    );
  }
}
