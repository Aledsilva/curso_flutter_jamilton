import 'package:flutter/material.dart';


class TerceiraPaginaExemplo extends StatefulWidget {
  const TerceiraPaginaExemplo({Key? key}) : super(key: key);

  @override
  State<TerceiraPaginaExemplo> createState() => _TerceiraPaginaExemploState();
}

class _TerceiraPaginaExemploState extends State<TerceiraPaginaExemplo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Terceira Página"),
    );
  }
}
