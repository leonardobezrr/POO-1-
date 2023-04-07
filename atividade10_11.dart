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

        body: const Tabela(),
      ),
    );
  }
}

class Tabela extends StatelessWidget {
  const Tabela({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
      ],
    );
  }
}
