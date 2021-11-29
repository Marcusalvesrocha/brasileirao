import 'package:brasileirao/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Brasileirão"),
      ),
      body: ListView.separated(
        separatorBuilder: (c, i) => Divider(),
        padding: EdgeInsets.all(16),
        itemCount: homeController.tabela!.length,
        itemBuilder: (context, index) {
          final time = homeController.tabela![index];
          return ListTile(
            key: Key(index.toString()),
            leading: Image.network(time.brasao),
            title: Text(time.nome),
            trailing: Text(time.pontos.toString()),
          );
        },
      ),
    );
  }
}
