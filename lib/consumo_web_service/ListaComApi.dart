import 'dart:convert';

import 'package:curso_flutter_jamilton/consumo_web_service/PostDaLista.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaComApi extends StatefulWidget {
  const ListaComApi({Key? key}) : super(key: key);

  @override
  State<ListaComApi> createState() => _ListaComApiState();
}

class _ListaComApiState extends State<ListaComApi> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  PostDaLista postDaLista = PostDaLista(0, 0, "_title", "_body");

  Future<List<PostDaLista>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<PostDaLista> postagens = [];

    for (var post in dadosJson) {
      print("post: " + post["title"]);
      PostDaLista p =
          PostDaLista(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async {

    //método facilitado
    PostDaLista post = PostDaLista(125, 0 , "_title", "Co-corpo");
    var corpo = json.encode(
        post.toJson()
    );
    //método padrão inicial
    // var corpo = json.encode(
    //   {
    //     "userId": 125,
    //     "id": null,
    //     "title": "Título",
    //     "body": "Corpo da postagem",
    //   }
    // );

    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: corpo
    );
    
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  //atualiza o objeto INTEIRO
  _put() async {

    var corpo = json.encode(
      {
        "userId": 125,
        "id": null,
        "title": "Título ALTERADO",
        "body": "Corpo da postagem ALTERADA",
      }
    );

    http.Response response = await http.put(
      _urlBase + "/posts/3",
      headers: {
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: corpo
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

    //Pode atualizar um item indiidualmente
  _patch() async {

    var corpo = json.encode(
      {
        "userId": 358,
        "id": null,
        "title": null,
        "body": null,
      }
    );

    http.Response response = await http.patch(
      _urlBase + "/posts/3",
      headers: {
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: corpo
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }


  _delete() async {

    var corpo = json.encode(
        {
          "userId": 358,
          "id": null,
          "title": null,
          "body": null,
        }
    );

    http.Response response = await http.delete(
        _urlBase + "/posts/3",
    );

    if( response.statusCode == 200 ){
      //deu certo
    }else{
      //deu ruim
    }

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo Avançado Com Lista"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _post,
                    child: const Text("Salvar")
                ),
                ElevatedButton(
                    onPressed: _put,
                    child: const Text("Atualizar")
                ),
                ElevatedButton(
                    onPressed: _patch,
                    child: const Text("Atualizar 1")
                ),
                ElevatedButton(
                    onPressed: _delete,
                    child: const Text("Deletar")
                )
              ],

            ),

            Expanded(
              child: FutureBuilder<List<PostDaLista>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print("lista: Erro ao carregar");
                      } else {
                        print("lista: carregou!");
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, indice) {

                              List<PostDaLista> lista = snapshot.data!;
                              PostDaLista pdl = lista[indice];

                              return ListTile(
                                title: Text(pdl.title),
                                subtitle: Text(pdl.id.toString()),
                              );
                            }
                        );
                      }
                      break;
                  }

                  return const Center();
                },


              ),
            ),

          ],
        ),
      )
    );
  }
}
