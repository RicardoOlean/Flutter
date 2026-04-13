import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Teladelete extends StatefulWidget {
  const Teladelete({super.key});

  @override
  State<Teladelete> createState() => _TeladeleteState();
}

class _TeladeleteState extends State<Teladelete> {
  List resultado =  [];
  @override
  void initState(){ // Função para chamar açgp ap abrir a tela
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    final respostaServidor  = await http.get(Uri.parse('http://10.109.72.24:3000/tarefas'));
     if( respostaServidor.statusCode == 200){
      fazerGet();
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        resultado = dados;  // Acessa a primeira tarefa do array de tarefas
      });
     }
  }

  void fazerDelete (final id)async{
    final respostaServidor = await http.delete(Uri.parse('http://10.109.72.24:3000/tarefas/$id'));
    if (respostaServidor.statusCode == 200 || respostaServidor.statusCode == 204){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Dado apagado com sucesso")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App delete")),
        body:ListView(
          children: [
            for (final item in resultado )
            Card(
              child: ListTile(
                leading: Text(item["nome"]),
                trailing: GestureDetector(
                  onTap: () => fazerDelete(item["id"]),
                  child: Icon(Icons.delete, color: Colors.red),
                ),
              )
            )

          ],
        )
    

        );
      
      
    
  }
}