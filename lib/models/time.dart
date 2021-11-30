import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

class Time {
  String? nome;
  String? brasao;
  int? pontos;
  Color? cor;
  List<Titulo> titulos = [];

  Time({this.nome, this.brasao, this.pontos, this.cor});
}
