import 'package:brasileirao/controllers/home_controller.dart';
import 'package:brasileirao/controllers/theme_controller.dart';
import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:brasileirao/views/time_view.dart';
import 'package:brasileirao/widget/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var homeController;
  var themeController = ThemeController.to;

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
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (i) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(() => themeController.isDark.value
                      ? Icon(Icons.brightness_2)
                      : Icon(Icons.brightness_7)),
                  title: Obx(() => themeController.isDark.value
                      ? Text('Light')
                      : Text('Dark')),
                  onTap: () => themeController.changeTheme(),
                ),
              ),
            ],
          ),
        ],
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
                leading: SizedBox(
                  width: 40,
                  child: Hero(
                    tag: time.brasao.toString(),
                    child: Image.network(
                      time.brasao.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(time.nome.toString()),
                subtitle: Text("Títulos: ${time.titulos.length}"),
                trailing: Text(time.pontos.toString()),
                onTap: () {
                  Get.to(() =>
                      TimeView(key: Key(time.nome.toString()), time: time));
                },
              );
            },
          );
        },
      ),
    );
  }
}
