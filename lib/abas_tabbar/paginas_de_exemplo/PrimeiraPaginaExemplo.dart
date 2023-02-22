import 'package:flutter/material.dart';

class PrimeiraPaginaExemplo extends StatefulWidget {
  const PrimeiraPaginaExemplo({Key? key}) : super(key: key);

  @override
  State<PrimeiraPaginaExemplo> createState() => _PrimeiraPaginaExemploState();
}

class _PrimeiraPaginaExemploState extends State<PrimeiraPaginaExemplo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Primeira Página"),
    );
  }
}
