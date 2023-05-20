import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  var chave = ["name", "style", "ibu"];
  var coluna = ["oi", "como", "vai"];
  void carregar(index) {
    var res = null;

    print('carregar #1 - antes de carregarCervejas');
    if (index == 0)
      res = carregarCafes();
    else if (index == 1)
      res = carregarCervejas();
    else if (index == 2) res = carregarNacoes();
    /*
    Solução interessante de um colega ricsjs
    Deixei aqui para utilizar nas próximas
      var funcoes = [
      carregarCafe,
      carregarCervejas,
      carregarNacoes,
    ];

    funcoes[index]();
    */
    print('carregar #2 - carregarCervejas retornou $res');
  }

  void propCerveja() {
    chave = ["name", "style", "ibu"];
    coluna = ["Nome", "Estilo", "IBU"];
  }

  Future<void> carregarCervejas() async {
    propCerveja();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '20'});

    print('carregarCervejas #1 - antes do await');

    var jsonString = await http.read(beersUri);

    print('carregarCervejas #2 - depois do await');

    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
  }

  void propCafe() {
    chave = ["blend_name", "origin", "intensifier"];
    coluna = ["Nome", "Origem", "Intensidade"];
  }

  Future<void> carregarCafes() async {
    propCafe();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '20'});

    print('carregarCervejas #1 - antes do await');

    var jsonString = await http.read(beersUri);

    print('carregarCervejas #2 - depois do await');

    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
  }

  void propNacoes() {
    chave = ["nationality","language","capital"];
    coluna = ["Nacionalidade","Idioma","Capital"];
  }

  Future<void> carregarNacoes() async {
    propNacoes();
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '20'});

    print('carregarCervejas #1 - antes do await');

    var jsonString = await http.read(beersUri);

    print('carregarCervejas #2 - depois do await');

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
