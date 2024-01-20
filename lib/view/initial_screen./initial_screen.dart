import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/view/root/root.dart';
import 'package:jiitak_test/view/screen_2/screen_2.dart';
import 'package:jiitak_test/view/screen_3/screen_3.dart';

class InitilaScreen extends StatelessWidget {
  const InitilaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(() =>  RootPage());
                },
                child: const Text('Screen One',style: TextStyle(color: Colors.white),)),
            TextButton(
                onPressed: () {
                  Get.to(() => const ScreenTwo());
                },
                child: const Text('Screen Two',style: TextStyle(color: Colors.white),)),
            TextButton(
                onPressed: () {
                  Get.to(() =>  const ScreenThree());
                },
                child: const Text('Screen Three',style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}
