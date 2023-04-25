import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulário';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {
  
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite seu nome.';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite seu email.';
                }
                if (!value.contains('@')) {
                  return 'Por favor, digite um email válido.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  
                  if (_formKey.currentState!.validate()) {
                    
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando dados...')),
                    );
                    print('Nome: $_name\nEmail: $_email');
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
            
            RadioListTile(
              title: const Text('Masculino'),
              value: 'Masculino',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as String?;
                });
              },
            ),
            RadioListTile(
              title: const Text('Feminino'),
              value: 'Feminino',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as String?;
                });
              },
            ),
            RadioListTile(
              title: const Text('Gilete'),
              value: 'Gilete',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as String?;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
