import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/main.dart';

void main() {
  testWidgets('meu primeiro teste', (WidgetTester tester) async {
    // 1. Ambiente para carregar os elementos
    // Scaffold ou MaterialApp para carregar elementos do Materil Design
    await tester.pumpWidget(MaterialApp(home: MyHomePage(title: "Teste")));

    // 2. Modo de buscar os elementos
    // 3. Verificações/asserções
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Teste'), findsOneWidget);

    // 4. Interação com widgets
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // atualiza a tela (estado)

    expect(find.text('1'), findsOneWidget);

    // Verifico se o componente foi carregado em tela
    expect(find.byType(FloatingActionButton), findsOneWidget); 
  });
}