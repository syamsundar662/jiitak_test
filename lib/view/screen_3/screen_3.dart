import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiitak_test/utils/constants.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  List<XFile> pickedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('店舗プロフィール編集'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              print(pickedFiles);
            },
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: textFieldHeading.length,
                  itemBuilder: (context, index) {
                    return CustomTextField(
                      index: index,
                    );
                  },
                ),
              ),
              kHeight10,
              Text('data'),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/image_1.jpg',
                              ))),
                    );
                  },
                ),
              ),
              kHeight10,
              Text('data'),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/image_1.jpg',
                              ))),
                    );
                  },
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.add_circle_outline_sharp),
                label: const Text('Add images'),
                onPressed: () async {
                  //   pickedFiles = await imagePicker(ImageSource.gallery);
                  // setState(() {
                  // });
                  multiImagePicker();
                  print(pickedFiles);
                },
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:pickedFiles.isEmpty? 3:pickedFiles.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: pickedFiles.isEmpty
                              ? Image.asset('assets/image_1.jpg')
                              : Image.file(File(pickedFiles[index].path)),
                        ),
                      ),
                     pickedFiles.isNotEmpty? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration( 
                            color: const Color.fromARGB(54, 23, 23, 23),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                pickedFiles.removeAt(index);
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              size: 14,
                            )),
                      ):Container(),
                    ]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // imagePicker(ImageSource source) async {
  //   final pickedFile = await ImagePicker().pickImage(source: source);
  //   if (pickedFile != null) {
  //     print(pickedFile.path);
  //     return File(pickedFile.path);
  //   }
  //   return null;
  // }

  multiImagePicker() async {
    final selectedFiles = await ImagePicker()
        .pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    // ignore: unnecessary_null_comparison
    if (selectedFiles != null && selectedFiles.isNotEmpty) {
      setState(() {
        pickedFiles = selectedFiles;
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No images selected')));
    }
  }

  SizedBox _mapSection() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GoogleMap(
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
          height: 50,
          child: TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
