import 'package:coinedone/blocs/controller.dart';
import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:coinedone/constants/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';

class BottenSheet extends StatelessWidget {
  BottenSheet({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController starttimecontroller = TextEditingController();
  final TextEditingController endtimecontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController phonenumbetcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.all(16),
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "  Add Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.blueColor,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            AppSizedBoxes.sizedboxH10,
            const Text(
              "  Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSizedBoxes.sizedboxH5,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.bgblueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Name",
                ),
              ),
            ),
            AppSizedBoxes.sizedboxH10,
            const Text(
              "  Date and time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSizedBoxes.sizedboxH10,
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 0  ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.bgblueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  BottomContainer(
                    controller: starttimecontroller,
                    text: 'Start Time',
                  ),
                  // const Divider(
                  //   color: AppColors.darkgreyColor,
                  // ),
                  BottomContainer(
                    text: 'End Time',
                    controller: endtimecontroller,
                  ),
                  // const Divider(
                  //   color: AppColors.darkgreyColor,
                  // ),
                  BottomContainer(
                    text: 'DAte',
                    controller: datecontroller,
                  ),
                  // const Divider(
                  //   color: AppColors.darkgreyColor,
                  // ),
                  BottomContainer(
                    text: 'Phone number',
                    controller: phonenumbetcontroller,
                  ),
                ],
              ),
            ),
            AppSizedBoxes.sizedboxH10,
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  elevation: 0,
                ),
                // style: ButtonStyle(maximumSize: ),
                child: const Text('Add Schedule'),

                onPressed: () {
                  posting();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BottomContainer extends StatelessWidget {
//   const BottomContainer(
//       {super.key, required this.text, required this.controller});
//   final String text;
//   final TextEditingController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppColors.bgblueColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextFormField(
//         keyboardType: TextInputType.datetime,
//         controller: controller,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           suffixText: "90",
//           hintText: text,
//           suffixIcon: const Icon(Icons.arrow_forward_ios),
//         ),
//       ),
//     );
//   }
// }

class BottomContainer extends StatelessWidget {
  BottomContainer({super.key, required this.text, required this.controller});
  final String text;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkgreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
