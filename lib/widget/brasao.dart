import 'dart:ffi';

import 'package:flutter/material.dart';

class Brasao extends StatelessWidget {
  var imagem;
  var tamanho;

  Brasao({Key? key, this.imagem, this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: Hero(
        tag: imagem,
        child: Image.network(
          imagem,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
