import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

enum ItemType { beer, coffee, nation, none }

class DataService {
  static const MAX_N_ITENS = 20;
  static const MIN_N_ITENS = 5;
  static const DEFAULT_N_ITENS = 12;
  

  int _numberOfItens = DEFAULT_N_ITENS;

  set numberOfItens(n) {
    _numberOfItens = n<= 0 ? MIN_N_ITENS :n > MAX_N_ITENS? MAX_N_ITENS : n;
  }

  int get numberOfItems => numberOfItems;

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  void carregar(index) {
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];
    funcoes[index]();
  }

  void carregarItens(String path, ItemType itemType, List<String> propertyNames, List<String> columnNames) {
    // Ignorar solicitação se uma requisição já estiver em curso
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    // Emitir estado de loading se os itens em exibição não forem do tipo atual
    if (tableStateNotifier.value['itemType'] != itemType) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': itemType,
      };
    }

    var itemsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: path,
      queryParameters: {'size': '$_numberOfItens'},
    );

    http.read(itemsUri).then((jsonString) {
      var itemsJson = jsonDecode(jsonString);

      // Se já houver itens do tipo atual no estado da tabela...
      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        itemsJson = [...tableStateNotifier.value['dataObjects'], ...itemsJson];
      }

      tableStateNotifier.value = {
        'itemType': itemType,
        'status': TableStatus.ready,
        'dataObjects': itemsJson,
        'propertyNames': propertyNames,
        'columnNames': columnNames,
      };
    });
  }

  void carregarCafes() {
    carregarItens(
      'api/coffee/random_coffee',
      ItemType.coffee,
      ["blend_name", "origin", "variety"],
      ["Nome", "Origem", "Tipo"],
    );
  }

  void carregarNacoes() {
    carregarItens(
      'api/nation/random_nation',
      ItemType.nation,
      ["nationality", "capital", "language", "national_sport"],
      ["Nome", "Capital", "Idioma", "Esporte"],
    );
  }

  void carregarCervejas() {
    carregarItens(
      'api/beer/random_beer',
      ItemType.beer,
      ["name", "style", "ibu"],
      ["Nome", "Estilo", "IBU"],
    );
  }
}

final dataService = DataService();
