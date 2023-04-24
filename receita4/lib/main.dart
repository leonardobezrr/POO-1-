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
          body: 
          ListView(
            shrinkWrap: true,
            children: [
              MyTileWidget(objects: dataObjects),
            ],
          ),
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


class MyTileWidget extends StatelessWidget {
  final List<Map<String, String>> objects;
  
  const MyTileWidget({required this.objects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: objects.length,
      itemBuilder: (BuildContext context, int index) {
        final obj = objects[index];

        return Card(
          child: ListTile(
            title: Text(obj['name']!),
            subtitle: Text('${obj['style']} - ${obj['ibu']} IBU'),
          ),
        );
      },
    );
  }
}
