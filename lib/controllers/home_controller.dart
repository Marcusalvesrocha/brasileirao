import 'package:brasileirao/repositories/time_repository.dart';
import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';

class HomeController {
  late TimeRepository timeRepository;

  HomeController() {
    timeRepository = TimeRepository();
  }

  List<Time> get tabela => timeRepository.times;
}
