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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lista
  final List<int> _itens = [];
  // controlador do scroll
  final ScrollController _scrollController = ScrollController();
  // controle de estado carregando
  bool _carregandoMais = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _carregarItens();
    _scrollController.addListener(_verificarScroll);
  }

  void _carregarItens() {
    final proximo = _itens.length + 1;
    _itens.addAll(List.generate(20, (index) => proximo + index));
  }

  void _verificarScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _carregarMais();
    }
  }

  Future<void> _carregarMais() async {
    if (_carregandoMais) return;

    setState(() {
      _carregandoMais = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _carregarItens();
      _carregandoMais = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Itens dinamicos")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _itens.length + 1,
        itemBuilder: (context, index) {
          if (index < _itens.length) {
            return ListTile(title: Text("Item ${_itens[index]}"));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child:
                    _carregandoMais
                        ? const CircularProgressIndicator()
                        : const Text("Todos os itens carregados"),
              ),
            );
          }
        },
      ),
    );
  }
}
