import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({Key? key}) : super(key: key);

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("teste"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Navegação entre telas",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Manipulação de preferências",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Entrada de Dados",
                    style: TextStyle(
                        fontSize: 18
                    ),)
                  //aqui vamos ir pra outra tela com opções
                  ),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Consumo Web-Service",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Baixando Arquivos (PDF)",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Abas de navegação (TabBar)",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Utilizando Midias",
                  style: TextStyle(
                    fontSize: 18
                  ),
                  )
                  //aqui vai pra uma tela pra escolher entre audio e video
                  ),
              const Divider(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: const EdgeInsets.all(20)),
                  onPressed: () {},
                  child: const Text("Firebase",
                    style: TextStyle(
                        fontSize: 18
                    ),)),
            ],
          ),
        ),
      ),
    );
  }
}
