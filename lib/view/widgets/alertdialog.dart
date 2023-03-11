 import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

Widget okButton = ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(290, 50),
    elevation: 0,
  ),
  onPressed: () {},
  child: const Text(
    "Text",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
);

// set up the AlertDialog
AlertDialog alert = AlertDialog(
  title: const Text(
    "This overlaps with another schedule and can’t be saved.",
    style: TextStyle(
      color: AppColors.redColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  content: const Text(
    "Please modify and try again.",
    style: TextStyle(
      color: AppColors.blueColor,
      // fontWeight: FontWeight.bold,
      // fontSize: 20,
    ),
  ),
  actions: [
    okButton,
  ],
  backgroundColor: AppColors.whiteColor,
  // change the background color
);
