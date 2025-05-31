import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:geolocator/geolocator.dart';

import 'package:testes/services/distancia_service.dart';
import 'package:testes/services/localizacao_service.dart';

import 'localizacao_service_test.mocks.dart';

void main() {
  test('Deve calcular a distancia corretamente', () async {
    final localizacaoService = MockLocalizacaoService();

    when(localizacaoService.obterLocalizacaoAtual()).thenAnswer(
      (_) async => Position(
        latitude: -23.505,
        longitude: -46.633,
        timestamp: DateTime.now(),
        accuracy: 1.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        altitudeAccuracy: 0.0,
        headingAccuracy: 0.0,
      ),
    );

    final distanciaService = DistanciaService(localizacaoService);

    final distancia = await distanciaService.calcularDistancia(-23.506, -46.633);

    expect(distancia, greaterThan(0));
    print('Distancia calculada: $distancia metros');
  });
}
