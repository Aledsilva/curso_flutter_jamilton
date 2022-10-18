import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class BaixandoDocExcel extends StatefulWidget {
  const BaixandoDocExcel({Key? key}) : super(key: key);

  @override
  State<BaixandoDocExcel> createState() => _BaixandoDocExcelState();
}

class _BaixandoDocExcelState extends State<BaixandoDocExcel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: createExcel,
          child: const Text(
            'Create Excel'
          ),
        ),
      ),
    );
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();

    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Eu nasci pobre');
    sheet.getRangeByName('B1').setText('E também nasci otário');

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = "$path/Output.xlsx";
    final File file = File(fileName);

    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);

  }
}
