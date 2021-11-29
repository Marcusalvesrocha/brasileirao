import 'package:brasileirao/models/time.dart';

class HomeController {
  List<Time>? tabela;

  HomeController() {
    tabela = [
      Time(
        "Corinthians",
        "https://e.imguol.com/futebol/brasoes/40x40/corinthians.png.webp?v3",
        50,
      ),
      Time(
        "Bahia",
        "https://e.imguol.com/futebol/brasoes/40x40/bahia.png.webp?v3",
        40,
      ),
      Time(
        "Atlético Mineiro",
        "https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png.webp?v3",
        73,
      ),
      Time(
        "Grêmio",
        "https://e.imguol.com/futebol/brasoes/40x40/gremio.png.webp?v3",
        40,
      ),
    ];
  }
}
