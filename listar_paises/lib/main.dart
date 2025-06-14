import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListaDePaises(),
    );
  }
}

class ListaDePaises extends StatefulWidget {
  const ListaDePaises({super.key});

  @override
  State<ListaDePaises> createState() => _ListaDePaisesState();
}

class _ListaDePaisesState extends State<ListaDePaises> {

  // var paises;

  Future<void> _listarPaises() async {
    var url = Uri.https("restcountries.com", "/v3.1/all", {"fields" : "name,flags"});
    var response = await http.get(url);
    
    // setState(() {
      // var paises = convert.jsonDecode(response.body) as List<Map<String, dynamic>>;
    // });

    var jsobBody = json.jsonDecode(response.body);

    // print(paises[0]);
  }

  @override
  Widget build(BuildContext context) {
    // if(paises == null || paises.isEmpty){
      _listarPaises();
    // }
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de países")),
      body: Container(),
    );
  }
}
