import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, required String title})
      : super(
          key: key,
          title: Text(title),
          actions: [
            PopupMenuButton<Color>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("Azul"),
                  value: Colors.blue,
                ),
                const PopupMenuItem(
                  child: Text("Preto"),
                  value: Colors.black,
                ),
                const PopupMenuItem(
                  child: Text("Roxo"),
                  value: Colors.purple,
                ),
              ],
            )
          ],
        );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MyAppBar(title: "Dicas",),
          body: DataBodyWidget(
            objects: const [
              "La Fin du Monde - Bock - 56 ibu",
              "Sapporo Premiume - Sour Ale - 54 ibu",
              "Duvel - Pilsner - 82 ibu"
            ],
          ),
          bottomNavigationBar: NewNavBar(
            icons: const [
              Icons.checklist_outlined,
              Icons.menu,
              Icons.local_drink_outlined,
              Icons.flag_outlined
            ],
            onTabSelected: (index) {
              print("Tocaram no botão $index");
            },
          ),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTabSelected;

  NewNavBar({required this.icons, required this.onTabSelected});

  List<BottomNavigationBarItem> _buildItems() {
    return icons
        .map((icon) => BottomNavigationBarItem(
              icon: Icon(icon),
              label: '',
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabSelected,
      items: _buildItems(),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;
  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(child: Center(child: Text(obj)));
  }

  @override
  Widget build(BuildContext context) {
    List<Expanded> allTheLines = objects
        .map((obj) => Expanded(
              child: Center(child: Text(obj)),
            ))
        .toList();

    return Column(children: allTheLines);
  }
}
