// @dart=2.9


import 'package:curso_flutter_jamilton/abas_tabbar/AbasANDTabBar.dart';
import 'package:curso_flutter_jamilton/baixando_arquivos/arquivo_excell/baixando_doc_excel.dart';
import 'package:curso_flutter_jamilton/baixando_arquivos/arquivo_pdf/BaixandoPDF.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ApiEListasMenuScreen.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ConsumoServicoAvancado.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ConsumoServicoWeb.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/ListaComApi.dart';
import 'package:curso_flutter_jamilton/consumo_web_service/Listas.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaCheckBox.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaDadosMenuScreen.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaRadioButton.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaSlider.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/EntradaSwitch.dart';
import 'package:curso_flutter_jamilton/entrada_de_dados/banco_de_dados/home_banco_de_dados.dart';
import 'package:curso_flutter_jamilton/firebase_aula/FirebaseAula.dart';
import 'package:curso_flutter_jamilton/firebase_aula/login_auth_etc/LoginAutent.dart';
import 'package:curso_flutter_jamilton/manipulacao_de_dados/ManipulacaoPreferencias.dart';
import 'package:curso_flutter_jamilton/navegacao/TelaDois.dart';
import 'package:curso_flutter_jamilton/navegacao/TelaUm.dart';
import 'package:curso_flutter_jamilton/screens/HomePrincipal.dart';
import 'package:curso_flutter_jamilton/utilizando_midias/MidiasMenuScreen.dart';
import 'package:curso_flutter_jamilton/utilizando_midias/executando_sons/SonsHomeScreen.dart';
import 'package:curso_flutter_jamilton/utilizando_midias/executando_videos/VideosHomeScreen.dart';
import 'package:flutter/material.dart';

import 'entrada_de_dados/CampoTexto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';



void main(){

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePrincipal(),

        //Navegação entre telas
        '/naveg-tela-um': (context) => const TelaUm(),
        '/naveg-tela-dois': (context) {
          final args = ModalRoute.of(context).settings.arguments as Map;
          return TelaDois(valor: args['valor']);
        },

        '/manipulacao-prefs': (context) => const ManipulacaoPreferencias(),

        //entrada de dados
        '/entrada-dados-menu': (context) => const EntradaDadosMenuScreen(),
        '/campo-de-texto': (context) => const CampoTexto(),
        '/entrada-checkbox': (context) => const EntradaCheckBox(),
        '/entrada-radio-button': (context) => const EntradaRadioButton(),
        '/entrada-slider': (context) => const EntradaSlider(),
        '/entrada-switch': (context) => const EntradaSwitch(),

        //Consumo-Web e Listas
        '/api-e-listas-menu': (context) => const ApiEListasMenuScreen(),
        '/consumo-web': (context) => const ConsumoServicoWeb(),
        '/consumo-web-avancado': (context) => const ConsumoServicoAvancado(),
        '/listas': (context) => const Listas(),
        '/listas-com-api': (context) => const ListaComApi(),

        //se conseguir baixar outros tipos de aquivos isso vai virar um Menu, e cada botao vai baixar um arquivo
        '/baixando-pdf': (context) => const BaixandoPDF(),

        '/abas-e-tabbar': (context) => const AbasANDTabBar(),

        '/midias-menu': (context) => const MidiasMenuScreen(),
        '/exec-audio': (context) => const SonsHomeScreen(),
        '/exec-video': (context) => const VideoHomeScreen(),

        '/fire-base-aula' : (context) => const FirebaseAula(),
        '/fire-login-auth' : (context) => const LoginAutent(),


      },
    )
  );
}