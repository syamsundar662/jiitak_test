import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiitak_test/utils/constants.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('店舗プロフィール編集'),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications_none,
            size: 30,
          ),
          kWidth10
        ],
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
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
             SizedBox(
               height: 100 ,
               width: 100,
               child: ClipRRect( 
                 borderRadius: BorderRadius.circular(10),
                 child: GoogleMap(
                   scrollGesturesEnabled: false ,
                   mapType: MapType.hybrid ,  
                   myLocationButtonEnabled: true,
                   myLocationEnabled: true, 
                   zoomControlsEnabled: true, 
                   zoomGesturesEnabled: true,
                   initialCameraPosition:  CameraPosition(
                     target: LatLng(10.097699,76.342585), 
                     zoom: 14,
                   ), 
                   markers: { 
                      Marker( 
                       markerId: const MarkerId('marker_id'),
                       position:
                           LatLng(10.097699,76.342585),
                     ),
                   }, 
                   // ignore: prefer_collection_literals
                   gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                   
                   ),
               ),
             ),

          ],
        ),
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
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(textFieldHeading[index]),
        SizedBox(
          height: 50,
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}

