import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ConsumoServicoAvancado extends StatefulWidget {
  const ConsumoServicoAvancado({Key? key}) : super(key: key);

  @override
  State<ConsumoServicoAvancado> createState() => _ConsumoServicoAvancadoState();
}

class _ConsumoServicoAvancadoState extends State<ConsumoServicoAvancado> {

  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    
    return json.decode(response.body);
    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      //initialData: ,
        future: _recuperarPreco(),
        builder: (context, snapshot){

          String resultado = "";

          switch( snapshot.connectionState ){
            case ConnectionState.none :
              print("conexao none");
              break;

            case ConnectionState.waiting :
              print("conexao waiting");
              resultado = "Carregando...";
              break;

            case ConnectionState.active :
              print("conexao active");
              break;

            case ConnectionState.done :
              print("conexao done");

              if( snapshot.hasError){
                resultado = "Erro ao carregar os dados";
              }else{
                double valor = snapshot.data?["BRL"]["buy"];
                resultado = "Preço do bitcoin: ${valor.toString()}";
              }
              break;
          }
          return Center(
            child: Text(resultado),
          );
        }
    );
  }
}
