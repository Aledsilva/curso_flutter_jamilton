import 'package:flutter/material.dart';


class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  bool _escolhaConfig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),
      body: Container(
        child: Column(

          children: [

            //Funciona com Column POR SER UMA LISTA
            SwitchListTile(
              title: Text("Fazer backup automáticamente?"),
                value: _escolhaUsuario,
                onChanged: (valor){
                  setState(() {
                    _escolhaUsuario = valor;
                    print("Valor: " + valor.toString());
                  });
                }
            ),


            SwitchListTile(
                title: Text("Receber Notificações?"),
                value: _escolhaConfig,
                onChanged: (valor){
                  setState(() {
                    _escolhaConfig = valor;
                    print("Valor: " + valor.toString());
                  });
                }
            ),

            ElevatedButton(
                onPressed: (){

                  if(_escolhaUsuario){
                    print("escolha: ativar notificações");
                  }else{
                    print("escolha: NÃO ativar notificações");
                  }

                  if(_escolhaConfig){
                    print("escolha: ativar config");
                  }else{
                    print("escolha: NÃO ativar config");
                  }

                },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange
              ),
              child: Text("Salvar"),
            )

            //USAR COM ROW
            // Switch(
            //     value: _escolhaUsuario,
            //     onChanged: (valor){
            //       setState(() {
            //         _escolhaUsuario = valor;
            //         print("Valor: " + valor.toString());
            //       });
            //     }
            // ),
            // Text("Receber Notificações?")

          ],
        ),
      ),
    );
  }
}
