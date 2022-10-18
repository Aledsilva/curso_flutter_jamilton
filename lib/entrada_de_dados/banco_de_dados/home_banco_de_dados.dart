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

      "nome" : "João",
      "idade" : 27

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


    
    //print("usuarios: " + usuarios.toString());

  }


  @override
  Widget build(BuildContext context) {

    //_recuperarBancoDeDados();
    //_salvar();
    _listarUsuarios();

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

                },
                child: const Text("TESTAR")
            ),
          )

        ],
      ),
    );
  }
}
