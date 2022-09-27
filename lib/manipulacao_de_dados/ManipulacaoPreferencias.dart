import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManipulacaoPreferencias extends StatefulWidget {
  const ManipulacaoPreferencias({Key? key}) : super(key: key);

  @override
  State<ManipulacaoPreferencias> createState() => _ManipulacaoPreferenciasState();
}

class _ManipulacaoPreferenciasState extends State<ManipulacaoPreferencias> {

  String _txtSalvo = "Nada salvo!";
  final TextEditingController _controllerCampo = TextEditingController();

  _salvar () async {

    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Operacao (salvar): $valorDigitado");

  }

  _recuperar() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _txtSalvo = prefs.getString("nome") ?? "Sem valor";
    });

    print("Operacao (recuperar): $_txtSalvo");

  }

  _remover() async {
    
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("Operacao (remover)");
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          children: [
            Text(
                _txtSalvo,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _salvar,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent
                    ),
                    child: Text("Salvar")
                ),
                ElevatedButton(
                    onPressed: _recuperar,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent
                    ),
                    child: Text("Recuperar")
                ),
                ElevatedButton(
                    onPressed: _remover,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent
                    ),
                    child: Text("Remover")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
