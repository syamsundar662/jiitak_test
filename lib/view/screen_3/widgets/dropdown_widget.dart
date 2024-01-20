
import 'package:flutter/material.dart';
import 'package:jiitak_test/utils/constants.dart';

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
