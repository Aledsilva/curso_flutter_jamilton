import 'package:flutter/material.dart';

class MidiasMenuScreen extends StatefulWidget {
  const MidiasMenuScreen({Key? key}) : super(key: key);

  @override
  State<MidiasMenuScreen> createState() => _MidiasMenuScreenState();
}

class _MidiasMenuScreenState extends State<MidiasMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Executando Mídias"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, padding: const EdgeInsets.all(50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/exec-audio');
                },
                child: const Text(
                  "Executar Sons",
                  style: TextStyle(fontSize: 18),
                )),
            const Divider(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, padding: const EdgeInsets.all(50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/exec-video');
                },
                child: const Text(
                  "Executar Vídeos",
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
