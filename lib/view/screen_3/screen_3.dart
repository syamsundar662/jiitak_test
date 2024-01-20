import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiitak_test/controller/image_selector_controller.dart';
import 'package:jiitak_test/utils/constants.dart';

class ScreenThree extends StatelessWidget {
    ScreenThree({super.key});

  String? timeFrom;

  String? timeTo;

  List<String> time = ['2', '4', '5', '3'];
 
  @override
  Widget build(BuildContext context) {
    final ImageSelectorController imageController =
        Get.put(ImageSelectorController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('店舗プロフィール編集'),
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              _topTextFields(),
              _mapSection(),
              kHeight10,
              const Text('店舗外観*（最大3枚まで）'),
              _imageSelectorBoxes(imageController),
              kHeight10,
              const Text('店舗外観*（最大3枚まで）'),
              _imageSelectorBoxes(imageController),
              kHeight10,
              const Text('店舗外観*（最大3枚まで）'),
              _imageSelectorBoxes(imageController),
              kHeight10,
              const Text('店舗外観*（最大3枚まで）'),
              _imageSelectorBoxes(imageController),
              kHeight10,
              Text('data'),
              Row(
                children: [
                  DropDownWidget(value: timeFrom, item: time, hintText: 'From'),
                  DropDownWidget(value: timeTo, item: time, hintText: 'To'),
                ],
              ),
              kHeight10,
              Text('data'),
              Row(
                children: [
                  DropDownWidget(value: timeFrom, item: time, hintText: 'From'),
                  DropDownWidget(value: timeTo, item: time, hintText: 'To'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _imageSelectorBoxes(ImageSelectorController controller) {
    return SizedBox(
      height: screenFullHeight * .13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.imagePicker(index);
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
                        child: controller.pickedFiles[index] != null
                            ? Image.file(
                                File(controller.pickedFiles[index]!.path),
                                fit: BoxFit.cover,
                              )
                            : Image.asset('assets/imageselection.png'),
                      ),
                    ),
                    controller.pickedFiles[index] != null
              ? Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(54, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          controller.pickedFiles[index] = null;
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

  _topTextFields() {
    return SizedBox(
      height: screenFullHeight / 2.8,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.value,
    required this.item,
    required this.hintText,
  });

  final String? value;
  final List<String> item;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenFullHeight * .09,
      width: screenFullWidth / 2.4,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        value: value,
        onChanged: (String? newValue) {
          // setState(() {
          //   selectedCategoryvalue = newValue;
          // });
        },
        items: item.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(textFieldHeading[index]),
        SizedBox(
          height: screenFullHeight * .06,
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.4, color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
