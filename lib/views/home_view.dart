import 'package:brasileirao/controllers/home_controller.dart';
import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:brasileirao/views/time_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brasileirão"),
      ),
      body: Consumer<TimeRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            separatorBuilder: (c, i) => Divider(
              key: Key(i.toString()),
            ),
            padding: EdgeInsets.all(16),
            itemCount: repositorio.times.length,
            itemBuilder: (context, index) {
              final time = repositorio.times[index];
              return ListTile(
                key: Key(index.toString()),
                leading: Image.network(time.brasao.toString()),
                title: Text(time.nome.toString()),
                subtitle: Text("Títulos: ${time.titulos.length}"),
                trailing: Text(time.pontos.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (i) =>
                          TimeView(key: Key(time.nome.toString()), time: time),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
