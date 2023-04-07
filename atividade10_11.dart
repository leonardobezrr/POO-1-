import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Cervejas';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),

        body:const Tabela(),
      ),
    );
  }
}

class Tabela extends StatelessWidget {
  const Tabela({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Nome',
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Estilo',
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'IBU',
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('La Fin Du Monde')),
              DataCell(Text('Bock ')),
              DataCell(Text('65')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Sapporo Premium')),
              DataCell(Text('Sour Ale')),
              DataCell(Text('54')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('82')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Skol')),
              DataCell(Text('Pilsen')),
              DataCell(Text('11')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Brahma')),
              DataCell(Text('Standard American Lager')),
              DataCell(Text('10')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Heineken')),
              DataCell(Text('Pilsen morgob')),
              DataCell(Text('30')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Ouro Branco')),
              DataCell(Text('White Gold')),
              DataCell(Text('79')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Black bows')),
              DataCell(Text('Dart incense')),
              DataCell(Text('28')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Budweiser')),
              DataCell(Text('Headache')),
              DataCell(Text('5')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Stella')),
              DataCell(Text('Standard American Expensive')),
              DataCell(Text('32')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Brahma Puro Malte')),
              DataCell(Text('Pilsen')),
              DataCell(Text('24')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Nilsin')),
              DataCell(Text('Pirsen')),
              DataCell(Text('54')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Gold')),
              DataCell(Text('Extravagance')),
              DataCell(Text('33')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Thin Bottle')),
              DataCell(Text('Fat')),
              DataCell(Text('13')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Green Life')),
              DataCell(Text('PL')),
              DataCell(Text('22')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Puro Malte')),
              DataCell(Text('Pilsen')),
              DataCell(Text('66')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Thorne Malta')),
              DataCell(Text('Yango Bal')),
              DataCell(Text('44')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Posthurne')),
              DataCell(Text('Pirsen')),
              DataCell(Text('36')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Quirathi')),
              DataCell(Text('Malsarrar')),
              DataCell(Text('54')),
            ],
          ),
        ],
      ),
    );
  }
}
