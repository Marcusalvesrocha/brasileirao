import 'package:brasileirao/controllers/theme_controller.dart';
import 'package:brasileirao/repositories/time_repository.dart';
import 'package:brasileirao/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(ChangeNotifierProvider(
    create: (context) => TimeRepository(),
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      title: "Brasileirão",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent[100],
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
