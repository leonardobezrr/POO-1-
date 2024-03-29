import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier =
      ValueNotifier({'status': TableStatus.idle, 'dataObjects': []});
  void carregar(index) {
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes,carregarUsers];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };
    funcoes[index]();
  }

  void carregarCafes() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '15'});
    http.read(beersUri).then((jsonStrig) {
      var beersJson = jsonDecode(jsonStrig);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["blend_name", "origin", "intensifier"],
        'columnsNames': ["Nome", "Origem", "Intensidade"],
      };
    }).catchError((error) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
      };
      print('Erro na busca da API: $error');
    });
  }

  Future<void> carregarNacoes() async {
    try {
      var beersUri = Uri(
          scheme: 'https',
          host: 'random-data-api.com',
          path: 'api/nation/random_nation',
          queryParameters: {'size': '15'});
      var jsonString = await http.read(beersUri);
      var beersJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["nationality", "language", "capital"],
        'columnsNames': ["Nacionalidade", "Idioma", "Capital"],
      };
    } catch (error) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
      };
      print('Erro na busca da API: $error');
    }
  }

  void carregarCervejas() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '15'});
    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["name", "style", "ibu"],
        'columnsNames': ["Nome", "Estilo", "IBU"],
      };
    }).catchError((error) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
      };
      print('Erro na busca da API: $error');
    }
    );
  }

  void carregarUsers() {
    var beersUri = Uri(
      //https://random-data-api.com/api/v2/users
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/v2/users',
        queryParameters: {'size': '15'});
    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["id", "first_name", "last_name"],
        'columnsNames': ["ID", "Nome", "Sobrenome"],
      };
    }).catchError((error) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
      };
      print('Erro na busca da API: $error');
    }
    );
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
                switch (value['status']) {
                  case TableStatus.idle:
                    return const Center(
                      child: Text(
                        "Toque em algum botão",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    );
                  case TableStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case TableStatus.ready:
                    return ListView(
                      children: [
                        DataTableWidget(
                            jsonObjects: value['dataObjects'],
                            columnNames: value['columnsNames'],
                            propertyNames: value['propertyNames'])
                      ],
                    );
                  case TableStatus.error:
                    return const Center(
                      child: Text(
                        "Reosse, deu erro !",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    );
                }
                return Text("...");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var _itemSelectedCallback;
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
        selectedItemColor:
          Colors.deepPurple, 
        unselectedItemColor: 
          Colors.black38, 
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined)),
          BottomNavigationBarItem(
              label: "Users", icon: Icon(Icons.people))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<dynamic> columnNames;
  final List<dynamic> propertyNames;

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
                    .map((propName) => DataCell(Text(obj[propName].toString())))
                    .toList()))
            .toList());
  }
}
