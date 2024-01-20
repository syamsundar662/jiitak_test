
import 'package:flutter/material.dart';
import 'package:jiitak_test/utils/constants.dart';

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
        kHeight5,
        Text(textFieldHeading[index]),
        SizedBox(
          height: screenFullHeight * .06,
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.4, color: Colors.grey.shade300),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
