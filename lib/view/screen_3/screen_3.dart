import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiitak_test/controller/image_selector_controller.dart';
import 'package:jiitak_test/utils/constants.dart';
import 'package:jiitak_test/view/screen_3/widgets/dropdown_widget.dart';
import 'package:jiitak_test/view/screen_3/widgets/image_selector_widget.dart';

class ScreenThree extends StatelessWidget {
  ScreenThree({super.key});

  String? timeFrom;

  String? timeTo;

  List<String> time = ['2', '4', '5', '3'];

  @override
  Widget build(BuildContext context) {
    final ImageSelectorController imageController =
        Get.put(ImageSelectorController());
    final ImageSelectorController imageController2 =
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
              // SizedBox(
              //   height: screenFullHeight / 1.6,
              //   child: ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: 4,
              //     itemBuilder: (
              //       context,
              //       indexs,
              //     ) {
              //       return ImageSelectorWidget(
              //         indexs: indexs,
              //         controller: imageController,
              //       );
              //     },
              //   ),
              // ),
              ImageSelectorWidget(controller: imageController),
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
