import 'package:flutter/material.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/utils/widgets/custom_text_style.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 155, 252),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      kWidth10,
                      CustomTextStyle(
                        content: 'Mer キッチン',
                        size: 20,
                        color: lightFont,
                        weight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomTextStyle(
                        content: '現在の獲得数',
                        size: 20,
                        color: lightFont,
                      ),
                      CustomTextStyle(
                        content: '30',
                        size: 35,
                        color: lightFont,
                        height: 1,
                        weight: FontWeight.bold,
                      ),
                      CustomTextStyle(
                        content: '個',
                        size: 20,
                        color: lightFont,
                      ),
                      kWidth10
                    ],
                  ),
                ),
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Color.fromARGB(205, 143, 117, 248),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                  )),
            ),
            title: const CustomTextStyle(
                content: 'スタンプカード詳細', size: 20, color: lightFont),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 165, 155, 252),
            actions: const [
              Icon(
                Icons.remove_circle_outline,
                size: 30,
                color: Colors.white,
              ),
              kWidth10
            ],
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Column(
          children: [
            kHeight20,
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    width: 400,
                    // height: 400,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 231, 231, 231),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                          blurRadius: 20.0,
                          // spreadRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: lightFont,
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 15,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 1,
                        crossAxisCount: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            'assets/stamp.png',
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('2/2'), kWIdth30],
            ),
            const Text('スタンプ獲得履歴'),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: .1,
                    endIndent: 20,
                    indent: 20,
                  );
                },
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text(
                      '2021 / 11 / 18',
                      style: TextStyle(height: 2),
                    ),
                    subtitle: Row(
                      children: [
                        Text('スタンプを獲得しました。'),
                        Spacer(),
                        Text('1 個'),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
