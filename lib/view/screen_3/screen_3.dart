import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiitak_test/controller/checkbox_controller.dart';
import 'package:jiitak_test/controller/image_selector_controller.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/view/screen_3/widgets/custom_textfield.dart';
import 'package:jiitak_test/view/screen_3/widgets/dropdown_widget.dart';
import 'package:jiitak_test/view/screen_3/widgets/image_selector_widget.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageSelectorController imageController =
        Get.put(ImageSelectorController());
    final CheckBoxController checkController = Get.put(CheckBoxController());
    return Scaffold(
      appBar: _appBarSection(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              _topTextFields(),
              kHeight10,
              _mapSection(),
              _imageSelector(imageController),
              kHeight10,
              const Text('営業時間*'),
              _dropDownOne(),
              kHeight10,
              const Text('ランチ時間*'),
              _dropDownTwo(),
              kHeight10,
              const Text('ランチ時間*'),
              _checkBox1(checkController),
              _checkBox2(checkController),
              const Text('料理カテゴリー*'),
              _dropDownThree(),
              kHeight10,
              const Text('ランチ時間*'),
              _dropDownFour(),
              const Text('キャッチコピー*'),
              const TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: '',
                    border: OutlineInputBorder()),
              ),
              const Text('座席数*'),
              const TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: '',
                    border: OutlineInputBorder()),
              ),
              const Text('喫煙席*'),
              _checkBox3(checkController),
              const Text('喫煙席*'),
              _checkBox4(checkController),
              const Text('来店プレゼント*'),
              _chechBox5(checkController),
              _imageSelectorBottom(imageController),
              const Text(' 来店プレゼント名*'),
              const TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: '',
                    border: OutlineInputBorder()),
              ),
              kHeight10,
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.orangeAccent.shade100),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {},
                      child: const Text(
                        '編集を保存',
                        style: TextStyle(color: Colors.white),
                      ))),
              kHeight20

              // ImageSelectorWidget(controller: imageController, rowIndex: 7)
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      elevation: 1,
      title: const Text('店舗プロフィール編集',style: TextStyle(fontSize: 15),),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.notifications_none,
            size: 30,
          ),
        ),
        kWidth10
      ],
      shadowColor: Colors.grey,
    );
  }

  Row _dropDownFour() {
    return Row(
              children: [
                SizedBox(
                    height: screenFullHeight * .06,
                    width: screenFullWidth / 3,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: '¥ 1,000',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide())),
                    )),
                const Text(
                  ' ~ ',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                    height: screenFullHeight * .06,
                    width: screenFullWidth / 3,
                    child: const TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: '¥ 2,000',
                          border: OutlineInputBorder()),
                    ))
              ],
            );
  }

  SizedBox _imageSelectorBottom(ImageSelectorController imageController) {
    return SizedBox(
              height: screenFullHeight * .13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, columnIndex) {
                  return InkWell(
                    onTap: () {
                      imageController.imagePicker2(columnIndex);
                    },
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: screenFullHeight * .13,
                                width: screenFullHeight * .13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: imageController
                                            .pickedFilesList1[columnIndex] !=
                                        null
                                    ? Image.file(
                                        File(imageController
                                            .pickedFilesList1[columnIndex]!
                                            .path),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/imageselection.png'),
                              ),
                            ),
                            imageController.pickedFilesList1[columnIndex] !=
                                    null
                                ? Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              54, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                          onTap: () {
                                            imageController.pickedFilesList1[
                                                columnIndex] = null;
                                            imageController.pickedFilesLists
                                                .refresh();
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
  }

  SizedBox _chechBox5(CheckBoxController checkController) {
    return SizedBox(
              height: screenFullHeight * .05,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: checkController.checkboxItems5.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              side: const BorderSide(color: Colors.grey),
                              activeColor: Colors.orangeAccent,
                              value:
                                  checkController.checkboxItems5[index].value,
                              onChanged: (value) => checkController
                                  .checkboxItems5[index].value = value!,
                            ),
                          ),
                          kWidth10,
                          Text(checkBox4[index]),
                          kWidth10,
                        ],
                      ));
                },
              ),
            );
  }

  SizedBox _checkBox4(CheckBoxController checkController) {
    return SizedBox(
              height: screenFullHeight * .05,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: checkController.checkboxItems4.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              side: const BorderSide(color: Colors.grey),
                              activeColor: Colors.orangeAccent,
                              value:
                                  checkController.checkboxItems4[index].value,
                              onChanged: (value) => checkController
                                  .checkboxItems4[index].value = value!,
                            ),
                          ),
                          kWidth10,
                          Text(checkBox3[index]),
                          kWidth10,
                        ],
                      ));
                },
              ),
            );
  }

  SizedBox _checkBox3(CheckBoxController checkController) {
    return SizedBox(
              height: screenFullHeight * .05,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: checkController.checkboxItems3.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              side: const BorderSide(color: Colors.grey),
                              activeColor: Colors.orangeAccent,
                              value:
                                  checkController.checkboxItems3[index].value,
                              onChanged: (value) => checkController
                                  .checkboxItems3[index].value = value!,
                            ),
                          ),
                          kWidth10,
                          Text(checkBox3[index]),
                          kWidth10,
                        ],
                      ));
                },
              ),
            );
  }

  SizedBox _imageSelector(ImageSelectorController imageController) {
    return SizedBox(
              height: screenFullHeight / 1.5,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (
                  context,
                  indexs,
                ) {
                  return ImageSelectorWidget(
                    rowIndex: indexs,
                    controller: imageController,
                  );
                },
              ),
            );
  }

  DropDownWidget _dropDownThree() {
    return DropDownWidget(
      value: item,
      item: const ['1', '2', '3'],
      hintText: '料理カテゴリー選択',
      width: screenFullWidth / 2,
    );
  }

  SizedBox _checkBox2(CheckBoxController checkController) {
    return SizedBox(
      height: screenFullHeight * .05,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: checkController.checkboxItems2.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() => Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      side: const BorderSide(color: Colors.grey),
                      activeColor: Colors.orangeAccent,
                      value: checkController.checkboxItems2[index].value,
                      onChanged: (value) =>
                          checkController.checkboxItems2[index].value = value!,
                    ),
                  ),
                  kWidth10,
                  Text(checkBox2[index]),
                  kWidth10,
                ],
              ));
        },
      ),
    );
  }

  SizedBox _checkBox1(CheckBoxController checkController) {
    return SizedBox(
      height: screenFullHeight * .05,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: checkController.checkboxItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() => SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        side: const BorderSide(color: Colors.grey),
                        activeColor: Colors.orangeAccent,
                        value: checkController.checkboxItems[index].value,
                        onChanged: (value) =>
                            checkController.checkboxItems[index].value = value!,
                      ),
                    ),
                    kWidth10,
                    Text(checkBox1[index]),
                    kWidth10
                  ],
                ),
              ));
        },
      ),
    );
  }

  Row _dropDownTwo() {
    return Row(
      children: [
        DropDownWidget(
          value: timeFrom,
          item: time,
          hintText: 'From',
          width: screenFullWidth / 2.7,
        ),
        const Text(
          ' ~ ',
          style: TextStyle(fontSize: 20),
        ),
        DropDownWidget(
          value: timeTo,
          item: time,
          hintText: 'To',
          width: screenFullWidth / 2.7,
        ),
      ],
    );
  }

  Row _dropDownOne() {
    return Row(
      children: [
        DropDownWidget(
          value: timeFrom,
          item: time,
          hintText: 'From',
          width: screenFullWidth / 2.7,
        ),
        const Text(
          ' ~ ',
          style: TextStyle(fontSize: 20),
        ),
        DropDownWidget(
          value: timeTo,
          item: time,
          hintText: 'To',
          width: screenFullWidth / 2.7,
        ),
      ],
    );
  }

  _topTextFields() {
    return SizedBox(
      height: screenFullHeight / 2.8,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: textFieldHeading.length,
        itemBuilder: (context, index) {
          return CustomTextField(
            index: index,
          );
        },
      ),
    );
  }

  SizedBox _mapSection() {
    return SizedBox(
      height: screenFullHeight * .3,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(10.097699, 76.342585),
              zoom: 12,
            ),
            // ignore: prefer_collection_literals
            gestureRecognizers: Set()
              ..add(
                  Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))),
      ),
    );
  }
}
