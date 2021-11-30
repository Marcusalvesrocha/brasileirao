import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CadastroTituloView extends StatefulWidget {
  Time? time;

  CadastroTituloView({Key? key, this.time}) : super(key: key);

  @override
  _CadastroTituloViewState createState() => _CadastroTituloViewState();
}

class _CadastroTituloViewState extends State<CadastroTituloView> {
  final _campeonatoController = TextEditingController();
  final _anoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  save() {
    Provider.of<TimeRepository>(context, listen: false).addTitulo(
      widget.time!,
      Titulo(_campeonatoController.text, _anoController.text),
    );
    Get.back();
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Cadastrado com sucesso!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Campeonato"),
        backgroundColor: widget.time!.cor,
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
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(23),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      save();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Salvar"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
