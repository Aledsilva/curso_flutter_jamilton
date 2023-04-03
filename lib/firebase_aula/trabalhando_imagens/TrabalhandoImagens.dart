import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class TrabalhandoImagens extends StatefulWidget {
  const TrabalhandoImagens({Key? key}) : super(key: key);

  @override
  State<TrabalhandoImagens> createState() => _TrabalhandoImagensState();
}

class _TrabalhandoImagensState extends State<TrabalhandoImagens> {

  var _imagem;
  String _statusUpload = "Upload não iniciado";
  String _urlImagemRecuperada = "";

  Future _recuperarImagem(bool daCamera) async {

    File imagemSelecionada;

    if(daCamera) {
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });

  }

  Future _uploadImagem() async {

    //referenciar aqrquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos_pasta").child("foto1.jpg");

    //fazer upload
    StorageUploadTask task = arquivo.putFile(_imagem);

    //controlar o progresso do upload
    task.events.listen((StorageTaskEvent stEvent) {

      if(stEvent.type == StorageTaskEventType.progress){
        setState(() {
          _statusUpload = "Em progresso";
        });
      }else if(stEvent.type == StorageTaskEventType.success){
        _statusUpload = "Upload realizado com sucesso!";
      }

    });

    //recuperar url da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot){

          _recuperarUrlImagem(snapshot);

    });

  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {

    String url = await snapshot.ref.getDownloadURL();
    print("resultado url: $url" );

    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mexendo com imagens"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(_statusUpload),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding: const EdgeInsets.all(15)
                  ),
                  onPressed: (){
                    _recuperarImagem(true);
                  },
                  child: const Text("Camera",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding: const EdgeInsets.all(15)
                  ),
                  onPressed: (){
                    _recuperarImagem(false);
                  },
                  child: const Text("Galeria",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),

            _imagem == null
            ? Container()
                : Image.file(_imagem),

            _imagem == null
            ? Container()
            : Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding: const EdgeInsets.all(15)
                  ),
                  onPressed: (){
                    _uploadImagem();
                  },
                  child: const Text("Upload Storage",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
            ),

            _urlImagemRecuperada == ""
            ? Container()
                : Image.network(_urlImagemRecuperada)


          ],
        ),
      ),
    );
  }
}
