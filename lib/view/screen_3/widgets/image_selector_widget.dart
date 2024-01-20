import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:jiitak_test/controller/image_selector_controller.dart';
import 'package:jiitak_test/utils/constants.dart';


class ImageSelectorWidget extends StatelessWidget {
  const ImageSelectorWidget({
    super.key,
    required this.controller,
  });

  final ImageSelectorController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenFullHeight / 1.6,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, rowIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(imageSelectorHeadings[0]),
                  kWidth10,
                  Text(
                    "(${imageSelectorHeadings2[0]})",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(
                height: screenFullHeight * .13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, columnIndex) {
                    return InkWell(
                      onTap: () {
                        controller.imagePicker(rowIndex, columnIndex);
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
                                  child:
                                      controller.pickedFilesLists[rowIndex][columnIndex] != null
                                          ? Image.file(
                                              File(controller
                                                  .pickedFilesLists[rowIndex][columnIndex]!
                                                  .path),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/imageselection.png'),
                                ),
                              ),
                              controller.pickedFilesLists[rowIndex][columnIndex] != null
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
                                              controller.pickedFilesLists[rowIndex][columnIndex] =
                                                  null;
                                              controller.pickedFilesLists.refresh();
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
              ),
            ],
          );
        },
      ),
    );
  }
}
