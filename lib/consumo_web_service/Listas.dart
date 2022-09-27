import 'package:flutter/material.dart';

class Listas extends StatefulWidget {
  const Listas({Key? key}) : super(key: key);

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];

    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Uuuuuiii!";
      item["descricao"] = "Demaaais ${i} ";

      _itens.add(item);

    }

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Aulas Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context, indice){
            
            return ListTile(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context){

                      return AlertDialog(
                        title: Text(_itens[indice]["titulo"]),
                        titleTextStyle: TextStyle(
                            color: Colors.black
                        ),
                        content: Text(_itens[indice]["descricao"]),

                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                print("Selecionado: Sim");
                                Navigator.pop(context);
                              },
                              child: Text("Sim")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                print("Selecionado: Não");
                                Navigator.pop(context);
                              },
                              child: Text("Não")
                          ),
                        ],

                        contentTextStyle: TextStyle(
                          color: Colors.black38
                        ),
                        backgroundColor: Colors.amber,
                      );

                    }
                );
                print("Click normal");
              },
              onLongPress: (){
                print("Click longoooo");
              },
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          
          }
        ),
      ),
    );
  }
}
