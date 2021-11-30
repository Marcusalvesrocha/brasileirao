import 'package:brasileirao/controllers/home_controller.dart';
import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/views/time_view.dart';
import 'package:flutter/material.dart';

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
      body: ListView.separated(
        separatorBuilder: (c, i) => Divider(
          key: Key(i.toString()),
        ),
        padding: EdgeInsets.all(16),
        itemCount: homeController.tabela!.length,
        itemBuilder: (context, index) {
          final time = homeController.tabela![index];
          return ListTile(
            key: Key(index.toString()),
            leading: Image.network(time.brasao),
            title: Text(time.nome),
            trailing: Text(time.pontos.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (i) => TimeView(key: Key(time.nome), time: time),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
