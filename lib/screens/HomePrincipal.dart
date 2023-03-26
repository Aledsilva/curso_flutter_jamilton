import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({Key? key}) : super(key: key);

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("teste"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _botaumRapidaum("Navegação entre telas", '/naveg-tela-um'),
              _botaumRapidaum("Manipulação de preferências", '/manipulacao-prefs'),
              _botaumRapidaum("Entrada de Dados", '/entrada-dados-menu'),
              _botaumRapidaum("Consumo Web-Service e Listas", '/api-e-listas-menu'),
              _botaumRapidaum("Baixando Arquivos (PDF)", '/baixando-pdf'),
              _botaumRapidaum("Abas de Navegação (TabBar)", '/abas-e-tabbar'),
              _botaumRapidaum("Utilizando Midias", '/midias-menu'),
              _botaumRapidaum("Firebase", '/fire-base-aula'),

            ],
          ),
        ),
      ),
    );
  }
}
