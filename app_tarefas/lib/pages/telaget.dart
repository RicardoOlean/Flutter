import 'dart:convert';

import 'package:app_tarefas/pages/teladelete.dart';
import 'package:app_tarefas/pages/telapost.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Telaget extends StatefulWidget {
  const Telaget({super.key});

  @override
  State<Telaget> createState() => _TelagetState();
}

class _TelagetState extends State<Telaget> {
  String resultado = ''; // Variavel para receber a tarefa

// meu ip 10.109.72.16
void fazerGet () async {
  final respostaServidor  = await http.get(Uri.parse('http://10.109.72.24:3000/tarefas'));
  if (respostaServidor.statusCode == 200){
    final dados = jsonDecode(respostaServidor.body);
    setState(() {
      resultado = dados[0]['nome'];  // Acessa a primeira tarefa do array de tarefas
    });
  }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Tasks")),
      body: Center(
        child: Column(
          children: [
            Text(resultado),
            TextButton(onPressed: fazerGet, child: Text("Fazer Get")),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Teladelete()));}, child: Text("Ir para Delete")),
            TextButton(onPressed: (){ Navigator.push (context, MaterialPageRoute(builder: (context) => Telapost()));}, child: Text("Ir para Post"))
          ],
        ),
      ),
    );
  }
}