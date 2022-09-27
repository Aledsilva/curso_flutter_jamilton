import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 0;
  String label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(

            children: [

              Slider(
                  value: valor,
                  min: 0,
                  max: 10,
                  //label precisa de divisions
                  label: label,
                  divisions: 5,

                  activeColor: Colors.red,
                  inactiveColor: Colors.black38,
                  onChanged: (novoValor){

                    setState(() {
                      valor = novoValor;
                      label = novoValor.toInt().toString();
                    });
                    print("Valor selecionado: " + novoValor.toString());
                  }
              ),

              ElevatedButton(
                  onPressed: (){
                    print("Valor selecionado: " + valor.toInt().toString());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber
                  ),
                  child: Text("Salvar")
              )
            ],

          ),
        ),
      ),
    );
  }
}
