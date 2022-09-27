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
        title: Text("Entrada Radio Button"),
      ),
      body: Container(
        child: Column(
          children: [

            //estrutura usada com Column
            RadioListTile(
              title: Text("Masculino"),
                value: "M",
                groupValue: _escolhaUser,
                onChanged: (escolha){
                  setState(() {
                    _escolhaUser = escolha.toString();
                  });
                }
            ),

            RadioListTile(
                title: Text("Feminino"),
                value: "F",
                groupValue: _escolhaUser,
                onChanged: (escolha){
                  setState(() {
                    _escolhaUser = escolha.toString();
                  });
                }
            ),

            RadioListTile(
                title: Text("Teste"),
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
                child: Text("Salvar")
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
