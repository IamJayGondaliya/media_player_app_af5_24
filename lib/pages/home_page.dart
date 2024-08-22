import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_player_app/controllers/slider_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SliderController sliderController = Get.put(
      SliderController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    initialPage: sliderController.currentIndex.value,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(
                      seconds: 1,
                    ),
                    onPageChanged: (index, controller) {
                      sliderController.changeIndex(index);
                      log("CI: ${sliderController.getCurrentIndex}");
                    },
                  ),
                  items: List.generate(
                    5,
                    (index) => Card(
                      color: Colors.primaries[index],
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 46,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Obx(() {
                      return AnimatedContainer(
                        duration: const Duration(
                          seconds: 1,
                        ),
                        height: 10,
                        width: index == sliderController.currentIndex.value
                            ? 20
                            : 10,
                        decoration: BoxDecoration(
                          color: index == sliderController.currentIndex.value
                              ? Colors.primaries[index]
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(5),
                      );
                    }),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      '/music_page',
                    );
                  },
                  child: const Text("Music Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      '/video_page',
                    );
                  },
                  child: const Text("Video Page"),
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
