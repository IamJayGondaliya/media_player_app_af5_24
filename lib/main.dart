import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_player_app/pages/home_page.dart';
import 'package:media_player_app/pages/music_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/music_page',
          page: () => MusicPage(),
        ),
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
      ],
    );
  }
}
