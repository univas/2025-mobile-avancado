import 'package:geolocator/geolocator.dart';

abstract class LocalizacaoService {
  Future<Position> obterLocalizacaoAtual();
}