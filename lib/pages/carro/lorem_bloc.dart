import 'dart:async';

import 'package:carros/pages/carro/lorem_api.dart';

class LoremBloc {
  static String lorem;

  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  fetch() async {
    String s = lorem ?? await LoremApi.getLorem();
    _streamController.add(s);
    lorem = s;
  }

  void dispose() {
    _streamController.close();
  }
}
