import 'package:flutter/material.dart' ; // só funciona na net 

void main() {
  MaterialApp app =MaterialApp(
  theme: ThemeData(
    primarySwatch:Colors.blue
    ),
  home: Scaffold(
    appBar:AppBar(
     title:Text ("Hello World"),
      ),
    body: Center(
      child:Column(
        children:[
          Text("Davi"),
          Text("Natan"),
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