import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  const EntradaCheckBox({Key? key}) : super(key: key);

  @override
  State<EntradaCheckBox> createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {

  bool _estaSelecionado = false;
  bool _comidaBR = false;
  bool _comidaMX = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Check Box"),
      ),
      body: Container(
        child: Column(
          children: [

            CheckboxListTile(
              title: Text("Comida"),
                subtitle: Text("Roscôvu"),
                activeColor: Colors.amberAccent,
                //selected: true,
                secondary: Icon(Icons.add_box),
                value: _comidaBR,
                onChanged: (valor){
                setState(() {
                  _comidaBR = valor!;
                });
                }
            ),
            CheckboxListTile(
              title: Text("Comida Mexicana"),
                subtitle: Text("Que burrico"),
                activeColor: Colors.amberAccent,
                //selected: true,
                secondary: Icon(Icons.add_box),
                value: _comidaMX,
                onChanged: (valor){
                setState(() {
                  _comidaMX = valor!;
                });
                }
            ),

            ElevatedButton(
                onPressed: (){
                  print("Comida Brasileira : " + _comidaBR.toString() +
                  "  Comida Mexicana : " + _comidaMX.toString());
                },
                child: const Text(
                    "Salvar",
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
            )

            // Text("Comida brasileira"),
            // Checkbox(
            //     value: _estaSelecionado,
            //     onChanged: (valor){
            //       print(" Checkbox: " + valor.toString() );
            //       setState(() {
            //         _estaSelecionado = valor!;
            //       });
            //     }
            // ),

          ],
        ),
      ),
    );
  }
}
