import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/pages/carro/carros_bloc.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> listaCarros;

  CarrosListView(this.listaCarros);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: listaCarros != null ? listaCarros.length : 0,
        itemBuilder: (context, index) {
          Carro c = listaCarros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto ??
                          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png',
                      width: 150,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "descrição...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () => _onClickCarro(context,c),
                      ),
                      FlatButton(
                        child: const Icon(Icons.share),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _onClickCarro(BuildContext context, Carro c) {
    push(context, CarroPage(c));
  }


}
