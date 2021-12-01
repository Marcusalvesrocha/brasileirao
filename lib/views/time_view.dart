import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:brasileirao/views/cadatro_titulo_view.dart';
import 'package:brasileirao/views/editar_titulo_view.dart';
import 'package:brasileirao/widget/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
                  child: SizedBox(
                    width: 250,
                    child: Hero(
                      tag: widget.time!.brasao.toString(),
                      child: Image.network(
                        widget.time!.brasao.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
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
    Get.to(() => CadastroTituloView(
          time: widget.time,
        ));
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
    final time = Provider.of<TimeRepository>(context)
        .times
        .firstWhere((t) => t.nome == widget.time!.nome);
    final quantidade = time.titulos.length;
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
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
                onTap: () {
                  Get.to(
                    () => EditarTituloView(
                      titulo: time.titulos[index],
                    ),
                    fullscreenDialog: true,
                  );
                },
              );
            },
          );
  }
}
