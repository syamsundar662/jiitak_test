import 'package:flutter/material.dart';

late double screenFullWidth;
late double screenFullHeight;
void size(BuildContext context) {
  screenFullWidth = MediaQuery.of(context).size.width;
  screenFullHeight = MediaQuery.of(context).size.height;
}

const lightFont = Colors.white;
const darkFont = Colors.black;

const kHeight5 = SizedBox(
  height: 5,
);
const kHeight10 = SizedBox(
  height: 10,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kHeight30 = SizedBox(
  height: 30,
);
const kHeight40 = SizedBox(
  height: 40,
);
const kHeight50 = SizedBox(
  height: 50,
);
const kHeight60 = SizedBox(
  height: 60,
);
const kHeight100 = SizedBox(
  height: 100,
);
const kHeight200 = SizedBox(
  height: 200,
);
const kWidth10 = SizedBox(
  width: 10,
);
const kWIdth20 = SizedBox(
  width: 20,
);
const kWIdth30 = SizedBox(
  width: 30,
);
const kWIdth40 = SizedBox(
  width: 40,
);

//image paths
List<String> mainImages = [
  'assets/image_1.jpg',
  'assets/image_2.png',
  'assets/image_3.jpg',
  'assets/image_4.jpg',
  'assets/image_5.jpg',
  'assets/image_6.jpg'
];
String? timeFrom;
String? timeTo;
String? item;
List<String> textFieldHeading = ['店舗名*', '代表担当者名*', '店舗電話番号*', '店舗住所*'];
List<String> imageSelectorHeadings = ['店舗外観*', '店舗内観*', "店舗内観*", "メニュー写真","キャッチコピー*",'座席数*',];
List<String> imageSelectorHeadings2 = ['最大3枚まで',"1枚〜3枚ずつ追加してください","1枚〜3枚ずつ追加してください","1枚〜3枚ずつ追加してください"];
List<String> time = ['2', '4', '5', '3'];
List<String> checkBox1 = ['月', '火', '水', '木'];
List<String> checkBox2 = ['金', '土', '日', '祝'];
List<String> checkBox3 = ['有', '無'];
List<String> checkBox4 = ['有', '有（最大３枚まで）'];
List<String> checkBoxHeadings = ['喫煙席*', '喫煙席*','来店プレゼント*'];

