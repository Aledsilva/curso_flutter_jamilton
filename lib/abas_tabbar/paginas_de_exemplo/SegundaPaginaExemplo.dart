import 'package:flutter/material.dart';

class SegundaPaginaExemplo extends StatefulWidget {
  const SegundaPaginaExemplo({Key? key}) : super(key: key);

  @override
  State<SegundaPaginaExemplo> createState() => _SegundaPaginaExemploState();
}

class _SegundaPaginaExemploState extends State<SegundaPaginaExemplo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Segunda Página"),
    );
  }
}
