import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/views/cadatro_titulo_view.dart';
import 'package:flutter/material.dart';

class TimeView extends StatefulWidget {
  Time? time;
  TimeView({Key? key, this.time}) : super(key: key);

  @override
  _TimeViewState createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time!.cor,
          title: Text(widget.time!.nome.toString()),
          actions: [
            IconButton(
              onPressed: tituloView,
              icon: Icon(Icons.add),
            )
          ],
          bottom: TabBar(
            tabs: listTabs(),
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Image.network(
                    widget.time!.brasao
                        .toString()
                        .replaceAll("40x40", "100x100"),
                  ),
                ),
                Text(
                  "Pontos: ${widget.time!.pontos.toString()}",
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
            titulos()
          ],
        ),
      ),
    );
  }

  tituloView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) =>
            CadastroTituloView(time: widget.time, onSave: addTitulo),
      ),
    );
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time!.titulos.add(titulo);
    });

    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Salvo com Sucesso!")));
  }

  List<Widget> listTabs() {
    return [
      Tab(
        icon: Icon(Icons.stacked_line_chart),
        text: "Estatísticas",
      ),
      Tab(
        icon: Icon(Icons.emoji_events),
        text: "Títulos",
      )
    ];
  }

  Widget titulos() {
    final quantidade = widget.time!.titulos.length;
    return quantidade == 0
        ? Container(
            child: Center(
              child: Text("Nenhum Título"),
            ),
          )
        : ListView.separated(
            itemCount: quantidade,
            separatorBuilder: (c, i) {
              return Divider(
                key: Key(widget.time!.nome.toString()),
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(widget.time!.titulos[index].campeonato),
                trailing: Text(widget.time!.titulos[index].ano),
              );
            },
          );
  }
}
