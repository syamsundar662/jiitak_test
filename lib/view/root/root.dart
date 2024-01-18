import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiitak_test/view/screen_1/home.dart';
import 'package:jiitak_test/view/screen_2/screen_2.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final screens = [ ScreenOne(), const ScreenTwo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                
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
           Text('打刻する',style: TextStyle(fontSize: 12),),
           SizedBox(height: 5.5,)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'さがす'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: 'お仕事'),
          BottomNavigationBarItem(icon: Icon(Iconsax.document_text), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble), label: 'チャット'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'マイページ'),
        ],
      ),
    );
  }
}
