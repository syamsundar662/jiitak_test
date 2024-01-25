import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/view/screen_1/home.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final screens = [const ScreenOne()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[0],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: SizedBox(
        height: screenFullHeight * .075,
        width: screenFullHeight * .075,
        child: FloatingActionButton(
          isExtended: false,
          elevation: 0,
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () {},
          child: const Icon(
            Iconsax.scanner,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 8,
        selectedFontSize: 8,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'さがす'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: 'お仕事'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_drop_up_rounded), label: '打刻する'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: 'チャット'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'マイページ'),
        ],
      ),
    );
  }
}
