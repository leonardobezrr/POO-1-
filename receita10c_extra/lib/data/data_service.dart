import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var valores = [5, 10, 20];

enum TableStatus { idle, loading, ready, error }

enum ItemType {
  beer,
  coffee,
  nation,
  none;

  String get asString => '$name';

  List<String> get columns => this == coffee
      ? ["Nome", "Origem", "Tipo"]
      : this == beer
          ? ["Nome", "Estilo", "IBU"]
          : this == nation
              ? ["Nome", "Capital", "Idioma", "Esporte"]
              : [];

  List<String> get properties => this == coffee
      ? ["blend_name", "origin", "variety"]
      : this == beer
          ? ["name", "style", "ibu"]
          : this == nation
              ? ["nationality", "capital", "language", "national_sport"]
              : [];
}

class DataService {
  static int get MAX_N_ITEMS => valores[2];
  static int get MIN_N_ITEMS => valores[0];
  static int get DEFAULT_N_ITEMS => valores[1];

  int _numberOfItems = DEFAULT_N_ITEMS;

  var objetoOriginal = [];

  set numberOfItems(n) {
    _numberOfItems = n < 0
        ? MIN_N_ITEMS
        : n > MAX_N_ITEMS
            ? MAX_N_ITEMS
            : n;
  }

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  void carregar(index) {
    final params = [ItemType.coffee, ItemType.beer, ItemType.nation];

    carregarPorTipo(params[index]);
  }

  void ordenarEstadoAtual(String propriedade, [bool cresc = true]) {
    List objetos = tableStateNotifier.value['dataObjects'] ?? [];

    if (objetos == []) return;

    var objOrdenado = objetos;

    bool crescente = cresc;

    bool precisaTrocarPeloProximo(atual, proximo) {
      final ordemCorreta = crescente ? [atual, proximo] : [proximo, atual];
      return ordemCorreta[0][propriedade]
              .compareTo(ordemCorreta[1][propriedade]) >
          0;
    }

    objOrdenado.sort((a, b) {
      if (precisaTrocarPeloProximo(a, b)) {
        return 1;
      } else if (precisaTrocarPeloProximo(b, a)) {
        return -1;
      } else {
        return 0;
      }
    });

    emitirEstadoOrdenado(objOrdenado, propriedade);
  }

  void filtrarEstadoAtual(String filtrar) {
    List objetos = objetoOriginal;

    if (objetos.isEmpty) return;

    List objetosFiltrados = objetoOriginal;

    if (filtrar != '') {
      objetosFiltrados = objetos
          .where((objeto) =>
              objeto.toString().toLowerCase().contains(filtrar.toLowerCase()))
          .toList();
    } else {
      objetosFiltrados = objetoOriginal;
    }

    emitirEstadoFiltrado(objetosFiltrados);
  }

  Uri montarUri(ItemType type) {
    return Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/${type.asString}/random_${type.asString}',
        queryParameters: {'size': '$_numberOfItems'});
  }

  Future<List<dynamic>> acessarApi(Uri uri) async {
    var jsonString = await http.read(uri);

    var json = jsonDecode(jsonString);

    json = [...tableStateNotifier.value['dataObjects'], ...json];

    return json;
  }

  void emitirEstadoOrdenado(List objOrdenado, String propriedade) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);

    estado['dataObjects'] = objOrdenado;

    estado['sortCriteria'] = propriedade;

    estado['ascending'] = true;

    tableStateNotifier.value = estado;
  }

  void emitirEstadoCarregando(ItemType type) {
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type
    };
  }

  void emitirEstadoPronto(ItemType type, var json) {
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': json,
      'propertyNames': type.properties,
      'columnNames': type.columns
    };

    objetoOriginal = json;
  }

  void emitirEstadoFiltrado(List objetosFiltrados) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);

    estado['dataObjects'] = objetosFiltrados;

    tableStateNotifier.value = estado;
  }

  bool temRequisicaoEmCurso() => tableStateNotifier.value['status'] == TableStatus.loading;

  bool mudouTipoDeItemRequisitado(ItemType type) => tableStateNotifier.value['itemType'] != type;

  void carregarPorTipo(ItemType type) async {
    if (temRequisicaoEmCurso()) return;

    if (mudouTipoDeItemRequisitado(type)) {
      emitirEstadoCarregando(type);
    }

    var uri = montarUri(type);

    var json = await acessarApi(uri); //, type);

    emitirEstadoPronto(type, json);
  }
}

final dataService = DataService();