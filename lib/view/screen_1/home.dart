import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:jiitak_test/controller/app_controller/controller.dart';
import 'package:jiitak_test/utils/constants.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                // controller: _searchQuery,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.tune,
            size: 35,
          ),
          Icon(
            Icons.favorite_border_outlined,
            size: 35,
            color: Colors.red,
          ),
          SizedBox(
            width: 13,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(38.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.orange.shade400,
                Colors.orange.shade100
              ])),
              height: 37.0,
              child: const Center(child: Text("2022年 5月 26日（木）")),
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              activeColor: Colors.orangeAccent,
              locale: "ja",
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: cardContents(index, controller),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: floatingActionButtonWidget(),
      // bottomNavigationBar: bottonNavigationBarWidget(),
    );
  }

  SizedBox floatingActionButtonWidget() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: () {},
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }

  Stack cardContents(int index, AppController controller) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.asset(
                    mainImages[index],
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 160,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.amber.shade50),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '介護付き有料老人ホーム',
                                    style: TextStyle(
                                        color: Colors.amber.shade700,
                                        fontSize: 13),
                                  )),
                            ),
                            const Text(
                              '¥ 6,000',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        kHeight5,
                        const Text('5月 31日（水）08 : 00 ~ 17 : 00'),
                        const Text('北海道札幌市東雲町3丁目916番地17号'),
                        const Text('交通費 300円'),
                        kHeight5,
                        SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '住宅型有料老人ホームひまわり倶楽部',
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.toggleLike(index);
                                    },
                                    child: Obx(
                                        () => controller.likeStatusList[index]
                                            ? const Icon(
                                                Icons.favorite,
                                                size: 30,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                size: 30,
                                                color: Colors.grey,
                                              )))
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
          left: 15,
          bottom: 220,
          child: Container(
            height: 20,
            width: 80,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 99, 99),
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
                child: Text(
              '本日まで',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
