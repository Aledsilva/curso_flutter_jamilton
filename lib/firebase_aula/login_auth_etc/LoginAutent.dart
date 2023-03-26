import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginAutent extends StatefulWidget {
  const LoginAutent({Key? key}) : super(key: key);

  @override
  State<LoginAutent> createState() => _LoginAutentState();
}

class _LoginAutentState extends State<LoginAutent> {

  FirebaseAuth auth = FirebaseAuth.instance;

  _criandoNovoUser() async{

    /*criando usuario email e senha*/

    String email = "eu@eu.com";
    String senha = "353535";

    auth.createUserWithEmailAndPassword(
        email: email,
        password: senha
    ).then((firebaseUser){
      print("novo usuario: Sucesso!! " + firebaseUser.email);
    }).catchError((erro){
      print("novo usuario: erro " + erro.toString() );
    });
  }

  _acessandoAuth() async{

    String email = "eu@eu.com";
    String senha = "353535";

    auth.signInWithEmailAndPassword(
        email: email,
        password: senha
    ).then((firebaseUser){
      print("LOGAR usuario: sucesso!! e-mail " + firebaseUser.email);
    }).catchError((erro){
      print("LOGAR usuario: erro " + erro.toString());
    });

  }


  _deslogarUsuario() async{

    auth.signOut();
    FirebaseUser usuarioAtual = await auth.currentUser();

    if(usuarioAtual != null){
      print("Usuario atual logado email: " + usuarioAtual.email);
    }else{//deslogado
      print("Usuario atual está DESLOGADO");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login com Firebase"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800]
                ),
                  onPressed: (){
                _criandoNovoUser();
              }, child: const Text("Cadastrar")
              ),
            ),Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[800]
                ),
                  onPressed: (){
                    _acessandoAuth();
              }, child: const Text("Entrar")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[800]
                ),
                  onPressed: (){
                _deslogarUsuario();
              }, child: const Text("Deslogar")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                  onPressed: (){

                  }, child: const Text("Excluir")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
