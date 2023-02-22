import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomeBancoDeDados extends StatefulWidget {
  const HomeBancoDeDados({Key? key}) : super(key: key);

  @override
  State<HomeBancoDeDados> createState() => _HomeBancoDeDadosState();
}

class _HomeBancoDeDadosState extends State<HomeBancoDeDados> {

  String teste1 = "1";
  String teste2 = "2";
  String teste3 = "3";
  String teste4 = "4";


  _recuperarBancoDeDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");
    
    var retorno = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";

        db.execute(sql);
      }
    );

    return retorno;
    print("aberto: " + retorno.isOpen.toString());

  }

  _salvar() async{

    Database bd = await _recuperarBancoDeDados();


    Map<String, dynamic> dadosUsuario = {

      "nome" : "Priscila",
      "idade" : 22

    };

    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id");

  }

  _listarUsuarios() async  {

    Database bd = await _recuperarBancoDeDados();

    //String sql = "SELECT * FROM usuarios WHERE id = 5 ";
    //String sql = "SELECT * FROM usuarios WHERE idade >= 20 AND idade <=30 ";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 20 and 50 ";
    //String sql = "SELECT * FROM usuarios WHERE idade IN (23,25) ";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%L%' ";
    String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC "; //ASCendente DESCendente LIMIT quantidade

    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios ){

      print(
        "item id: ${usuario['id'].toString()} "
            " nome: ${usuario['nome']} "
            " idade: ${usuario['idade'].toString()}"
      );
    }

  }


  _recuperarUsuarioPeloId (int id) async {

    Database bd = await _recuperarBancoDeDados();

    List usuarios = await bd.query(
      "usuarios",
        columns: ["id", "nome", "idade"],
        where: "id = ? ",
        whereArgs: [id]
    );

    for(var usuario in usuarios){
      print(
          "item id: " + usuario['id'].toString() +
          "nome: " + usuario['nome'] +
          "idade: " + usuario['idade'].toString()
      );
    }

  }

  _excluiUsuario(int id) async {

    Database bd = await _recuperarBancoDeDados();

    int retorno = await bd.delete(
      "usuarios",
      // where: "id = ?",
      // whereArgs: [id]
      where: " nome = ? AND idade = ?",
      whereArgs: ["Alexandre", 28]
    );

    print("item quantidade removida: ${retorno}");

  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Alexandre",
      "idade" : 23
    };

    bd.update(
        "usuarios",
        dadosUsuario,
        where: "id = ?",
        whereArgs: [id]
    );

  }



  @override
  Widget build(BuildContext context) {

    //_recuperarBancoDeDados();
    //_salvar();

    //_atualizarUsuario(1);
    //_recuperarUsuarioPeloId(1);
    //_excluiUsuario(2);
    //_listarUsuarios();


    return Scaffold(
      appBar: AppBar(
        title: const Text("Banco de Dados SQFlite"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Text(teste1),
          Text(teste2),
          Text(teste3),
          Text(teste4),


          Center(
            child: ElevatedButton(
                onPressed: (){
                  _listarUsuarios();
                },
                child: const Text("TESTAR")
            ),
          )

        ],
      ),
    );
  }
}
