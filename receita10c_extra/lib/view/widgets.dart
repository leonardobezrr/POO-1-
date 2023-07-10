import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 176, 39, 39),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(callback: dataService.filtrarEstadoAtual),
        ),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            switch (value['status']) {
              case TableStatus.idle:
                return Center(child: Text("Toque em algum botão cumpade"));

              case TableStatus.loading:
                return Center(child: CircularProgressIndicator());

              case TableStatus.ready:
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTableWidget(
                        jsonObjects: value['dataObjects'],
                        propertyNames: value['propertyNames'],
                        columnNames: value['columnNames'],
                      ),
                    ),
                  ),
                );

              case TableStatus.error:
                return Text("Ihh...deu erro...");
            }

            return Text("...");
          },
        ),
        bottomNavigationBar:
            NewNavBar(itemSelectedCallback: dataService.carregar),
      ),
    );
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
          icon: Icon(Icons.coffee_outlined, color: Color.fromARGB(255, 176, 39, 39)),          
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined, color: Color.fromARGB(255, 176, 39, 39)),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined, color: Color.fromARGB(255, 176, 39, 39)),
        ),
      ],
    );
  }
}

class DataTableWidget extends HookWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const [],
  });

  @override
  Widget build(BuildContext context) {
    final sortAscending = useState(true);
    final sortColumnIndex = useState(1);

    return DataTable(
      sortAscending: sortAscending.value,
      sortColumnIndex: sortColumnIndex.value,
      dataRowColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 255, 255, 255)),
      columns: columnNames
          .map(
            (name) => DataColumn(
              onSort: (columnIndex, ascending) {
                sortColumnIndex.value = columnIndex;
                sortAscending.value = !sortAscending.value;

                dataService.ordenarEstadoAtual(
                    propertyNames[columnIndex], sortAscending.value);
              },
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(
                        obj[propName],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class MyAppBar extends HookWidget {
  final _callback;

  MyAppBar({callback}) : _callback = callback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(7);

    return AppBar(
      backgroundColor:Color.fromARGB(255, 176, 39, 39),
      actions: [
        Flexible(
          child: TextField(
            onChanged: (value) {
              _callback(value);
            },
            cursorColor: Color.fromARGB(255, 176, 39, 39),
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            decoration: const InputDecoration(
              hintText: '\t\tDigite algo...',
            ),
          ),
        ),
        PopupMenuButton(
          initialValue: state.value,
          itemBuilder: (_) => valores
              .map(
                (num) => PopupMenuItem(
                  value: num,
                  child: Text("Carregar $num itens por vez"),
                ),
              )
              .toList(),
          onSelected: (number) {
            state.value = number;
            dataService.numberOfItems = number;
          },
        ),
      ],
    );
  }
}