import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUser = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada Radio Button"),
      ),
      body: Container(
        child: Column(
          children: [

            //estrutura usada com Column
            RadioListTile(
              title: const Text("Masculino"),
                value: "M",
                groupValue: _escolhaUser,
                onChanged: (escolha){
                  setState(() {
                    _escolhaUser = escolha.toString();
                  });
                }
            ),

            RadioListTile(
                title: const Text("Feminino"),
                value: "F",
                groupValue: _escolhaUser,
                onChanged: (escolha){
                  setState(() {
                    _escolhaUser = escolha.toString();
                  });
                }
            ),

            RadioListTile(
                title: const Text("Teste"),
                value: "T",
                groupValue: _escolhaUser,
                onChanged: (escolha){
                  setState(() {
                    _escolhaUser = escolha.toString();
                  });
                }
            ),

            ElevatedButton(
                onPressed: (){
                  print("Resultado: " + _escolhaUser);
                },
                child: const Text("Salvar")
            )

            //Estrutura usada com Row
            // Text("Masculino"),
            // Radio(
            //     value: "m",
            //     groupValue: _escolhaUser,
            //     onChanged: (escolha){
            //       print("resultado: " + escolha.toString());
            //
            //       setState(() {
            //         _escolhaUser = escolha.toString();
            //       });
            //
            //     }
            // ),
            //
            // Text("Feminino"),
            // Radio(
            //     value: "f",
            //     groupValue: _escolhaUser,
            //     onChanged: (escolha){
            //       print("resultado: " + escolha.toString());
            //
            //       setState(() {
            //         _escolhaUser = escolha.toString();
            //       });
            //
            //     }
            // )

          ],
        ),
      ),
    );
  }
}
