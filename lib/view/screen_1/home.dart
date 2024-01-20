import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/controller/screen_one_controller.dart';
import 'package:jiitak_test/utils/constants.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) { 
    AppController controller = Get.put(AppController());
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Container(
          padding: const EdgeInsets.only(left: 10),
              height: screenFullHeight * .045,
              width: screenFullWidth*.7,
              child: TextField(
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
        actions: [
          const Icon(
            Icons.tune,
            size: 30,
          ),
          const Icon(
            Icons.favorite_border_outlined,
            size: 30,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: screenFullWidth*.04,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.orange.shade400,
                Colors.orange.shade100
              ])),
              height: screenFullHeight * .04,
              child: const Center(child: Text("2022年 5月 26日（木）")),
            )),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            kHeight20,
            SizedBox(
              height: screenFullHeight * .09,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {
                          controller.calendarTimeLine(index);
                        },
                        child: Container(
                          margin: index == 0
                              ? const EdgeInsets.only(left: 20)
                              : const EdgeInsets.only(right: 8),
                          width: screenFullHeight * .06,
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.orangeAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('木',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                '${index + 26}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: cardContents(index, controller),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: floatingActionButtonWidget(),
    );
  }

  SizedBox floatingActionButtonWidget() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        heroTag: 'common',
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: () {
        },
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
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenFullWidth * .4,
                              height: screenFullHeight * .03,
                              decoration:
                                  BoxDecoration(color: Colors.amber.shade50),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '介護付き有料老人ホーム',
                                    style: TextStyle(
                                        color: Colors.amber.shade700,
                                        fontSize: 10),
                                  )),
                            ),
                            const Text(
                              '¥ 6,000',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        kHeight5,
                        const Text(
                          '5月 31日（水）08 : 00 ~ 17 : 00',
                          style: TextStyle(fontSize: 11),
                        ),
                        const Text(
                          '北海道札幌市東雲町3丁目916番地17号',
                          style: TextStyle(fontSize: 11),
                        ),
                        const Text(
                          '交通費 300円',
                          style: TextStyle(fontSize: 11),
                        ),
                        kHeight5,
                        SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '住宅型有料老人ホームひまわり倶楽部',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 11),
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
                                                color: Color.fromARGB(255, 210, 210, 210),
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
          bottom: 200,
          child: Container(
            height: 20,
            width: 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 99, 99),
                borderRadius: BorderRadius.circular(3)),
            child: const Center(
                child: Text(
              '本日まで',
              style: TextStyle(color: Colors.white,fontSize: 10),
            )),
          ),
        ),
      ],
    );
  }
}

 // Padding(
            //   padding: const EdgeInsets.only(left: 15.0),
            //   child: EasyDateTimeLine(
            //     initialDate: DateTime.now(),
            //     onDateChange: (selectedDate) {
            //       //`selectedDate` the new date selected.
            //     },
            //     activeColor: Colors.orangeAccent,
            //     locale: "ja",
            //   ),
            // ),

