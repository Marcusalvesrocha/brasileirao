import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditarTituloView extends StatefulWidget {
  Titulo? titulo;

  EditarTituloView({Key? key, this.titulo}) : super(key: key);

  @override
  _EditarTituloViewState createState() => _EditarTituloViewState();
}

class _EditarTituloViewState extends State<EditarTituloView> {
  var _campeonatoController = TextEditingController();
  var _anoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _campeonatoController.text = widget.titulo!.campeonato;
    _anoController.text = widget.titulo!.ano;
  }

  editar() {
    Provider.of<TimeRepository>(context, listen: false).editTitulo(
      titulo: widget.titulo,
      ano: _anoController.text,
      campeonato: _campeonatoController.text,
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Titulo"),
        actions: [
          IconButton(
            onPressed: () {
              editar();
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(23),
              child: TextFormField(
                controller: _anoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ano",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o ano do campeonato!";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.5, horizontal: 23),
              child: TextFormField(
                controller: _campeonatoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Campeonato",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o nome do campeonato!";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
