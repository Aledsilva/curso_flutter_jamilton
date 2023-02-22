import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class SonsHomeScreen extends StatefulWidget {
  const SonsHomeScreen({Key? key}) : super(key: key);

  @override
  State<SonsHomeScreen> createState() => _SonsHomeScreenState();
}

class _SonsHomeScreenState extends State<SonsHomeScreen> {
  
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _executar() async {

    audioPlayer.setVolume(_volume);

    if(primeiraExecucao){
      audioPlayer = await audioCache.play("stay_quer_voar.mp3");
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }



    // String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
    // int resultado = await audioPlayer.play(url);
    //
    // if(resultado == 1){
    //   //ok
    // }

  }

  _pausar() async {

    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      //sucesso
    }

  }

  _parar() async {

    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      //sucesso
    }


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Executando Sons"),
      ),
      body: Column(
        children: [

          Slider(
              value: _volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novoVolume){
                setState(() {
                  _volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);

              }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      _executar();
                      },
                    child: Image.asset("assets/imagens/play_icon.png"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      _pausar();
                      },
                    child: Image.asset("assets/imagens/pause_icon.png"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      _parar();
                      },
                    child: Image.asset("assets/imagens/stop_icon.png"),
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}
