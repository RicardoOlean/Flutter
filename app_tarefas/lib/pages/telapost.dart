import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class Telapost extends StatefulWidget {
  const Telapost({super.key});

  @override
  State<Telapost> createState() => _TelapostState();
}

class _TelapostState extends State<Telapost> {
  TextEditingController valorDigitado = TextEditingController();
void fazerPost() async {
  final respostaServidor = await http.post(Uri.parse('http://10.109.72.24:3000/tarefas'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({
    "nome": valorDigitado.text
  }) 
  );
  if (respostaServidor.statusCode == 201 || respostaServidor.statusCode == 200){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado enviado com sucesso")));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Post")),
        body: Center(
          child: Column(
            children: [
              TextField(controller: valorDigitado),
              TextButton(onPressed: fazerPost, child: Text("Fazer Post"))
            ],
          ),
      ),
      );
  }
}