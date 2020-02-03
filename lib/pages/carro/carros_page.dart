import 'package:carros/pages/carro/carros_bloc.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

import 'carro.dart';
import 'carros_listview.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  String get tipo => widget.tipo;
  final _bloc = CarrosBloc();

  List<Carro> listaCarros;

  @override
  void initState() {
    super.initState();
    _bloc.loadData(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível localizar os carros");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        listaCarros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(listaCarros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.loadData(tipo);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
