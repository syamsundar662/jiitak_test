import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/view/screen_1/home.dart';
import 'package:jiitak_test/view/screen_2/screen_2.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final screens = [const ScreenOne(), const ScreenTwo()];

  @override
  Widget build(BuildContext context) {
    // size(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[0],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                isExtended: false,
                elevation: 0,
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {},
                child: const Icon(
                  Iconsax.scanner,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              '打刻する',
              style: TextStyle(fontSize: 8),
            ),
            SizedBox(
              height: screenFullHeight * .0095,
            )
          ],
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
          BottomNavigationBarItem(icon: Icon(Iconsax.document_text), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: 'チャット'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'マイページ'),
        ],
      ),
    );
  }
}
