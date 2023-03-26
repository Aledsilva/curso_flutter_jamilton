import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseAula extends StatefulWidget {
  const FirebaseAula({Key? key}) : super(key: key);

  @override
  State<FirebaseAula> createState() => _FirebaseAulaState();
}

class _FirebaseAulaState extends State<FirebaseAula> {

  Firestore db = Firestore.instance;


  Widget _botaumRapidaum(String nomeDoBotao, String nomeDaRota){

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, padding: const EdgeInsets.all(20)),
          onPressed: () {
            Navigator.pushNamed(context, nomeDaRota);
          },
          child: Text(
            nomeDoBotao,
            style: const TextStyle(fontSize: 18),
          )),
    );

  }

  _aplicandoFiltrosFireBase() async {

    Firestore db = Firestore.instance;

    var pesquisa = "al";

    QuerySnapshot querySnapshot = await db.collection("usuarios")
    //.where("nome" , isEqualTo: "fernanda")
    //.where("idade" , isEqualTo: 28)
    // .where("idade" , isLessThan: 30)
    // .orderBy("idade", descending: true)
    // .orderBy("nome", descending: false)
    // .limit(2)



    .where("nome", isGreaterThanOrEqualTo: pesquisa)
    .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
    .getDocuments();

    for( DocumentSnapshot item in querySnapshot.documents ){
      var dados = item.data;
      print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
    }

  }

  _lendoDadosDoFireBase() async {
    DocumentSnapshot snapshot = await db.collection("usuarios").document("001").get();

    var dados = snapshot.data;
    print("dados: " + snapshot.data.toString());
    print("dados: " + dados["nome"] + "idade" + dados["idade"]);

    
    QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();
    print("dados usuarios: " + querySnapshot.documents.toString());

    for(DocumentSnapshot item in querySnapshot.documents){
      var dados = item.data;
      print("dados usuarios: " + dados.toString());
      print("dados usuarios: " + dados["nome"] + " - " + dados["idade"]);
    }
    
    //pra atualizar em tempo real

    db.collection("usuarios").snapshots().listen(
            (event) {

              for(DocumentSnapshot item in event.documents){
                var dados = item.data;
                print("dados usuarios: " + dados.toString());
                print("dados usuarios: " + dados["nome"] + " - " + dados["idade"]);
              }
    });

  }
  
  _excluirCoisasDoFirebase() async {
    db.collection("usuarios").document("003").delete();
  }


  _criarCoisasDoFireBase() async {

    db.collection("usuarios")
        .document("002")
        .setData(
      {
        "nome" : "Fernanda",
        "idade" : "26"
      }
    );

    //Exemplo para printar, foi aqui que a função virou asincrona
    DocumentReference ref = await db.collection("noticias")
        .add(
      {
        "titulo" : "Ondas de calor em São Paulo!",
        "descricao" : "texto de exempluuuuum..."
      }
    );

    print("Item salvo: " + ref.documentID);

    db.collection("noticias")
        .document("ypwF0BRyytEqqwEORZ1U")
        .setData(
        {
          "titulo" : "Ondas de calor em São Paulo! ALTERADO",
          "descricao" : "texto de exempluuuuum..."
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebae aulas"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.all(30)
                ),

                  onPressed: (){
                    _criarCoisasDoFireBase();
                  },

                  child: const Text("Adicionar ao Firebase",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.all(30)
                  ),

                  onPressed: (){
                    _lendoDadosDoFireBase();
                  },

                  child: const Text("Ler dados do Firebase",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.all(30)
                  ),

                  onPressed: (){
                    _excluirCoisasDoFirebase();
                  },

                  child: const Text("Excluir do Firebase",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.all(30)
                  ),

                  onPressed: (){
                    _aplicandoFiltrosFireBase();
                  },

                  child: const Text("Aplicando filtros no Firebase",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),

            _botaumRapidaum("Login e Autenticação", '/fire-login-auth'),

          ],
        ),
      ),
    );
  }
}
