import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:coinedone/constants/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';

class BottenSheet extends StatelessWidget {
  const BottenSheet({super.key});

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
                  icon: Icon(Icons.close),
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
                children: const [
                  BottomContainer(
                    text: 'Start Time',
                  ),
                  Divider(
                    color: AppColors.darkgreyColor,
                  ),
                  BottomContainer(
                    text: 'End Time',
                  ),
                  Divider(
                    color: AppColors.darkgreyColor,
                  ),
                  BottomContainer(
                    text: 'DAte',
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
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.bgblueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixText: "90",
          hintText: text,
          suffixIcon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
