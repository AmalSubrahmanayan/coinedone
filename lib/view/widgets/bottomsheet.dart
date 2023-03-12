// import 'dart:developer';

// import 'package:coinedone/blocs/controller.dart';
// import 'package:coinedone/constants/colors/app_colors.dart';
// import 'package:coinedone/constants/sizedboxes/app_sizedboxes.dart';
// import 'package:coinedone/model/phone_get_model/phone_get_model.dart';
// import 'package:coinedone/service/phone_get_service.dart';
// import 'package:flutter/material.dart';

// import '../../model/phone_post_model/phine_post_model.dart';
// import '../../service/phone_post_service.dart';

// class BottenSheet extends StatefulWidget {
//   BottenSheet({super.key});

//   @override
//   State<BottenSheet> createState() => _BottenSheetState();
// }

// class _BottenSheetState extends State<BottenSheet> {
//   final TextEditingController namecontroller = TextEditingController();

//   final TextEditingController starttimecontroller = TextEditingController();

//   final TextEditingController endtimecontroller = TextEditingController();

//   final TextEditingController datecontroller = TextEditingController();

//   final TextEditingController phonenumbetcontroller = TextEditingController();
// List<Datum> userDetails =[];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 700,
//       padding: const EdgeInsets.all(16),
//       color: AppColors.whiteColor,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "  Add Schedule",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: AppColors.blueColor,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 )
//               ],
//             ),
//             AppSizedBoxes.sizedboxH10,
//             const Text(
//               "  Name",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             AppSizedBoxes.sizedboxH5,
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: AppColors.bgblueColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextFormField(
//                 controller: namecontroller,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Name",
//                 ),
//               ),
//             ),
//             AppSizedBoxes.sizedboxH10,
//             const Text(
//               "  Date and time",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             AppSizedBoxes.sizedboxH10,
//             Container(
//               // margin: const EdgeInsets.symmetric(vertical: 0  ),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: AppColors.bgblueColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   BottomContainer(
//                     controller: starttimecontroller,
//                     text: 'Start Time',
//                   ),
//                   // const Divider(
//                   //   color: AppColors.darkgreyColor,
//                   // ),
//                   BottomContainer(
//                     text: 'End Time',
//                     controller: endtimecontroller,
//                   ),
//                   // const Divider(
//                   //   color: AppColors.darkgreyColor,
//                   // ),
//                   BottomContainer(
//                     text: 'DAte',
//                     controller: datecontroller,
//                   ),
//                   // const Divider(
//                   //   color: AppColors.darkgreyColor,
//                   // ),
//                   BottomContainer(
//                     text: 'Phone number',
//                     controller: phonenumbetcontroller,
//                   ),
//                 ],
//               ),
//             ),
//             AppSizedBoxes.sizedboxH10,
//             Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(350, 50),
//                   elevation: 0,
//                 ),
//                 // style: ButtonStyle(maximumSize: ),
//                 child: const Text('Add Schedule'),

//                 onPressed: () async {
//                   await posting();
//                  await getting();
//                   log('posting finished');
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> posting() async {
//     PhoneModel model = PhoneModel(
//       name: namecontroller.text,
//       startTime: starttimecontroller.text,
//       endTime: endtimecontroller.text,
//       date: datecontroller.text,
//       phoneNumber: phonenumbetcontroller.text,
//     );
//     PhoneModelService().savePhoneModel(model);
//   }
//   Future<void>getting()async{
//     final List<Datum> response = await PhoneService().getData(phonenumbetcontroller.text);
//     if(response!=null){
//       userDetails.addAll(response);

//     }
//   //   final data = await PhoneService(). getData(phonenumbetcontroller.text);
//   //   log(data.toString());
//   }
// }

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

import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({super.key, required this.text, required this.controller});
  final String text;
  final TextEditingController controller;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
