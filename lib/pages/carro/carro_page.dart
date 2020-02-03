import 'package:carros/pages/carro/lorem_api.dart';
import 'package:carros/pages/carro/lorem_bloc.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {

  final _bloc = LoremBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.fetch();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onClickPopumMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text('Editar'),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text('Deletar'),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text('Share'),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Image.network(widget.carro.urlFoto),
          blocoUm(),
          Divider(),
          blocoDois(),
        ],
      ),
    );
  }

  Row blocoUm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.carro.nome, fontSize: 20, bold: true),
            text(widget.carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: _onClickFavorito,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: _onClickShare,
              icon: Icon(
                Icons.share,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopumMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar!!!");
        break;
      case "Deletar":
        print("Deletar!!!");
        break;
      case "Share":
        print("Share!!!");
        break;
    }
  }

  void _onClickFavorito() {}

  void _onClickShare() {}

  blocoDois() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        text(widget.carro.descricao, fontSize: 16, bold: true),
        SizedBox(
          height: 20,
        ),

        StreamBuilder<String>(
          stream: _bloc.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(snapshot.data, fontSize: 14);
          },
        ),

      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();

  }
}
