import 'package:flutter/material.dart';


class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite um valor"
              ),
              //enabled: false,
              //maxLength: 5,
              //maxLengthEnforcement: false,
              // style: TextStyle(
              //   fontSize: 25,
              //   color: Colors.green
              // ),
              //obscureText: true, //Essa é boa pra senha
              onChanged: (String texto){
                print("valor " + texto);
              },

              onSubmitted: (String tex){
                print("valor sub " + tex);
              },

              controller: _textEditingController,

            ),
          ),
          ElevatedButton(
              onPressed: (){
                print("valor digitado: " + _textEditingController.text);
              },
            style: ElevatedButton.styleFrom(
              primary: Colors.green
            ),
              child: const Text("Salvar"),

          )
        ],
      ),
    );
  }
}
