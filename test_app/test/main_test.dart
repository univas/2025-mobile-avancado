import 'dart:math';

import 'package:test/test.dart';

void main(){
  
  group("Caminho feliz", () {
    test('Soma',()  {
        final resultado = 2 + 2;

        expect(resultado, equals(4)); // Compara igualdade
        expect(resultado, isNot(equals(5))); // Verificar valor diferente de
        expect(resultado, isNotNull); // Verifica se a variável está preenchida ou não (também tem o isNull)
        expect(true, isTrue); // Comparação booleana
        expect(false, isFalse); // Comparação booleana
        // greaterThan() maior que
        // lessThan() menor que
        expect("Nome de uma pessoa", contains("uma")); // Verifica se um valor (Numero ou string) está dentro do elemento passado.
        expect("", isEmpty); // strings, arrays, maps
        expect(5.1, closeTo(5, 0.1)); // Verifica assertividade em valores próximos com um delta
        
    });
  });

  group("Erros esperados", (){
    // expect(() async => await funcao(), throwsException );
  });
}