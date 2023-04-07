
import 'package:flutter/material.dart';


void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.orange,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
    home: Scaffold(
      appBar: AppBar(title: const Text("Receita de bolo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('\nBolo de ovos\n',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black87)),
            const Text('Ingredientes\n',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.black87)),
            const Text(
              '° 2 xícaras de açúcar ${'\n'}° 250g de margarina ${'\n'}° 3 ovos ${'\n'}° 3 xícaras de farinha de trigo (com fermento) ${'\n'}° 1 xícara de leite${'\n'}° 1 pitada de sal ${'\n'}',
              style: TextStyle(fontSize: 18, backgroundColor: Colors.orange),
            ),
            
            Image.network(
              'https://www.designi.com.br/images/preview/10097378.jpg',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ingrediente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Remover',
          ),
        ],
        selectedItemColor: Colors.orange[600],
      ),
    ),
  );

  runApp(app);
}
