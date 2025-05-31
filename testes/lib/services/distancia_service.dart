import 'package:geolocator/geolocator.dart';

import 'localizacao_service.dart';

class DistanciaService {
  final LocalizacaoService localizacaoService;

  DistanciaService(this.localizacaoService);

  Future<double> calcularDistancia(
    double latitudeDestino,
    double longitudeDestino,
  ) async {
    final posicaoAtual = await localizacaoService.obterLocalizacaoAtual();

    return Geolocator.distanceBetween(
      posicaoAtual.latitude,
      posicaoAtual.longitude,
      latitudeDestino,
      longitudeDestino,
    );
  }
}
