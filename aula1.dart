//Comentarios na linguagem dart
//Sempre import a biblioteca dart:io
import 'dart:io'; //o input esta dentro da biblioteca "dart:io"

//Função principal, é ela que roda seu codigo

void main(){
  // print("Hello word"); //Mostra na tela 
  // stdout.write("Hello word2\n"); //Mostra na tela tambem
  // print ("Digite seu nome:");
  // String nome = stdin.readLineSync()!;
  // print ("Ola seu nome é $nome");

  // print("Digite um numero");
  // int n1 = int.parse (stdin.readLineSync()!);

  // print("Digite mais um numero");
  // int n2 = int.parse(stdin.readLineSync()!);

  // int soma = (n1* n2);
  
  // print("O resultado é  $soma\n");

  // print("Digite um numero");
  // int n1 = int.parse (stdin.readLineSync()!);
  
  // print("Digite outro numero:");
  // int n2 = int.parse(stdin.readLineSync()!);

  // int multiplicacao = (n1 * n2);
  // print("O resultado é $multiplicacao");

  print("Digite um numero");
  double n1 = double.parse(stdin.readLineSync()!);
  
  print("Digite outro numero");
  double n2 = double.parse(stdin.readLineSync()!);
  
  double divisao = (n1 / n2);

  print("O resultado é $divisao");



}
