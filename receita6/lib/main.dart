import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);

  var keys = ["Key", "Key", "Key"];
  var columns = ["Aperte", "Em Algum", "Botão"];

  void carregar(index) {
    var carregarList = [
      carregarCafes,
      carregarCervejas,
      carregarNacoes,
    ];

    carregarList[index]();
  }


  void listCervejas() {
    keys = ["name", "style", "ibu"];
    columns = ["Nome", "Estilo", "IBU"];
  }


  void listCafes() {
    keys = ["name", "marca", "regiao"];
    columns = ["Nome", "Marca", "Região"];
  }

  void listNacoes() {
    keys = ["name", "idioma", "pib"];
    columns = ["Nome", "Idioma", "PIB"];
  }

  void carregarCervejas() {
    listCervejas();

    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
    ];
  }

  void carregarNacoes() {
    listNacoes();
    tableStateNotifier.value = [
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},{"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},{"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},{"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},{"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},{"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
      {"name": "Brasil", "idioma": "Português", "pib": "5"},
      {"name": "USA", "idioma": "Inglês", "pib": "10"},
      {"name": "Mexico", "idioma": "Mexicano", "pib": "2"},
    ];
  }

  void carregarCafes() {
    listCafes();

    tableStateNotifier.value = [
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Sul"},
      {"name": "Café Três Corações", "marca": "Adocicado", "regiao": "Norte"},
      {"name": "Capuchino", "marca": "Amargo", "regiao": "Nordeste"},
    ];
  }
}

final dataService = DataService();

//var dataObjects = [];
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
                      propertyNames: dataService.keys,
                      columnNames: dataService.columns)
                ]);
              }),
          bottomNavigationBar: NewNavBar(
            itemSelectedCallback: dataService.carregar,
          ),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback; //esse atributo será uma função

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);
    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index); //carregarCervejas();
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
      this.columnNames = const ["Aperte", "Em Algum", "Botão"],
      this.propertyNames = const ["Key", "Key", "Key"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: const TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
