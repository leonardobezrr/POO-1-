import 'package:flutter/material.dart' ; // só funciona na net 

void main() {
  MaterialApp app =MaterialApp(
  theme: ThemeData(
    primarySwatch:Colors.blueGrey
    ),
  home: Scaffold(
    appBar:AppBar(
     title:Text ("Seja bem-vindo"),
      ),
    body: Center(
      child:Column(
        children:[
          const Text(
              'Negrito',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),          
          const Text(
              'Itálico',
              style: TextStyle(fontStyle: FontStyle.italic)
          ),
          Text(
            'Greetings, planet!',
            style: TextStyle(
              fontSize: 40,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  const Offset(0, 20),
                  const Offset(150, 20),
                  <Color>[
                    Colors.red,
                    Colors.yellow,
                  ],
                )
            ),
          )
          Text("Vieira"),
          Text("De Oliveira")
        ]
      )
      ),
     
    bottomNavigationBar:Text("Página 1")
  
  )
    
  );
  
  
  runApp(app);
  }