import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

var dataObjects = [
  {"name": "La Fin Da Mul", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Miro Premium", "style": "Pilsner", "ibu": "21"},
  {"name": "Dani's Beer", "style": "Malte", "ibu": "44"},
  {"name": "Heiniken", "style": "Pilsner", "ibu": "33"},
  {"name": "Amstel", "style": "Alenou", "ibu": "22"},
  {"name": "Skol", "style": "Pilsner", "ibu": "12"},
  {"name": "Devassa", "style": "Imburat", "ibu": "17"},
  {"name": "Puro Malte", "style": "Fogassa", "ibu": "88"},
  {"name": "Lindi's Beer", "style": "Pilsner", "ibu": "55"},
  {"name": "Laravel Productions", "style": "Malte", "ibu": "32"},
  {"name": "Dona's Beer", "style": "Puro Gorgon", "ibu": "47"},
  {"name": "Gincard", "style": "Justa", "ibu": "40"},
  {"name": "Yorit Premium", "style": "Ien", "ibu": "15"},
  {"name": "Astar", "style": "Yellow", "ibu": "19"},
  {"name": "Duplo malte", "style": "Pilsner", "ibu": "77"},
];

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
          body: DataBodyWidget(objects: dataObjects),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  List objects;
  DataBodyWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
            columns: columnNames
                .map((name) => DataColumn(
                        label: Expanded(
                            child: Text(
                      name,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ))))
                .toList(),
            rows: objects
                .map((obj) => DataRow(
                    cells: propertyNames
                        .map((propName) => DataCell(Text(obj[propName])))
                        .toList()))
                .toList()));
  }
}
