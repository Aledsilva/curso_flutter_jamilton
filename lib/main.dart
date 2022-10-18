import 'package:curso_flutter_jamilton/baixando_arquivos/arquivo_excell/baixando_doc_excel.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ConsumoServicoAvancado.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ConsumoServicoWeb.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ListaComApi.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/Listas.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaCheckBox.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaRadioButton.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaSlider.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaSwitch.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/banco_de_dados/home_banco_de_dados.dart';
import 'package:curso_flutter_jamilton/manipulacao_de_dados/ManipulacaoPreferencias.dart';
import 'package:curso_flutter_jamilton/navegacao/TelaUm.dart';
import 'package:flutter/material.dart';

import 'entrada_de_dados/CampoTexto.dart';

void main(){
  runApp(
    const MaterialApp(
      home: HomeBancoDeDados(),
    )
  );
}