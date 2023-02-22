import 'package:curso_flutter_jamilton/abas_tabbar/paginas_de_exemplo/PrimeiraPaginaExemplo.dart';
import 'package:curso_flutter_jamilton/abas_tabbar/paginas_de_exemplo/SegundaPaginaExemplo.dart';
import 'package:curso_flutter_jamilton/abas_tabbar/paginas_de_exemplo/TerceiraPaginaExemplo.dart';
import 'package:flutter/material.dart';

class AbasANDTabBar extends StatefulWidget {
  const AbasANDTabBar({Key? key}) : super(key: key);

  @override
  State<AbasANDTabBar> createState() => _AbasANDTabBarState();
}

class _AbasANDTabBarState extends State<AbasANDTabBar> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abas"),
        bottom: TabBar(
          controller: _tabController,
            tabs: const [
              Tab(
                //text: "Home",
                icon: Icon(Icons.home),
              ),
              Tab(
                //text: "Email",
                icon: Icon(Icons.email),
              ),
              Tab(
                //text: "Conta",
                icon: Icon(Icons.account_circle),
              ),
            ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PrimeiraPaginaExemplo(),
          SegundaPaginaExemplo(),
          TerceiraPaginaExemplo()
        ],

      ),
    );
  }
}
