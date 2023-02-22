import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class BaixandoPDF extends StatefulWidget {
  const BaixandoPDF({Key? key}) : super(key: key);

  @override
  State<BaixandoPDF> createState() => _BaixandoPDFState();
}

class _BaixandoPDFState extends State<BaixandoPDF> {

  String url = "http://www.iea.agricultura.sp.gov.br/out/custoproducao/manual.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baixando PDF"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => openFile(
                  url: url,
                  fileName: 'arquivo.pdf'
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
                child: const Text("Baixar PDF"),
            ),
          )
        ],
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if(file == null) return;
    print("Path: ${file.path}");
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/${name}');

    try {
      final response = await Dio().get(
          url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0
          )
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }

}


