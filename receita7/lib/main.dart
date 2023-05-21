import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  var chave = ["name", "style", "ibu"];
  var coluna = ["oi", "como", "vai"];
  void carregar(index) {
    if (index == 0) {
      carregarCafes('15');
    } 
    else if (index == 1){
      carregarCervejas('15');
    } 
    else if (index == 2){ 
      carregarNacoes('15');
    }
  }

  void propCerveja() {
    chave = ["name", "style", "ibu"];
    coluna = ["Nome", "Estilo", "IBU"];
  }

  Future<void> carregarCervejas(String size) async {
    propCerveja();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': size.toString()});

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);
    tableStateNotifier.value = beersJson;
  }

  void propCafe() {
    chave = ["blend_name", "origin", "intensifier"];
    coluna = ["Nome", "Origem", "Intensidade"];
  }

  Future<void> carregarCafes(String size) async {
    propCafe();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': size.toString()});

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
  }

  void propNacoes() {
    chave = ["nationality", "language", "capital"];
    coluna = ["Nacionalidade", "Idioma", "Capital"];
  }

  Future<void> carregarNacoes(String size) async {
    propNacoes();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': size.toString()});

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return ListView(children: [
                  DataTableWidget(
                      jsonObjects: value,
                      propertyNames: dataService.chave,
                      columnNames: dataService.coluna)
                ]);
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
