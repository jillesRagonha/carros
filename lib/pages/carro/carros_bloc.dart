import 'package:carros/pages/carro/simple_bloc.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>> loadData(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
