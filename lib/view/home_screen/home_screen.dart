import 'dart:developer';

import 'package:coinedone/blocs/controller.dart';
import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:coinedone/view/widgets/bottomsheet.dart';
import 'package:coinedone/view/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../constants/sizedboxes/app_sizedboxes.dart';
import '../../model/phone_get_model/phone_get_model.dart';
import '../../model/phone_post_model/phine_post_model.dart';
import '../../service/phone_get_service.dart';
import '../../service/phone_post_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController starttimecontroller = TextEditingController();

  final TextEditingController endtimecontroller = TextEditingController();

  final TextEditingController datecontroller = TextEditingController();

  final TextEditingController phonenumbetcontroller = TextEditingController();
  List<Datum> userDetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Calendar(),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 460,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Container(
                                height: 80,
                                width: 60,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.bgblueColor,
                                ),
                                child: const Icon(
                                  Icons.calendar_today,
                                  size: 24,
                                  color: AppColors.blueColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: RichText(
                                text: TextSpan(
                                  text: userDetails[index].startTime,
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${userDetails[index].endTime}\n',
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: userDetails[index].name,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: userDetails.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Row(
                          children: const [
                            SizedBox(
                              width: 80,
                            ),
                            Dash(
                                direction: Axis.vertical,
                                length: 30,
                                dashLength: 3,
                                dashColor: Colors.grey),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, bottom: 10),
                child: FloatingActionButton.small(
                  onPressed: () async {
                    // 'alert' is the AlertDialog defined in your code
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return alert;
                    //   },
                    // );
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 700,
                          padding: const EdgeInsets.all(16),
                          color: AppColors.whiteColor,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
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

                                    onPressed: () async {
                                      await posting();
                                      await getting();
                                      log('posting finished');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  ),
                    // );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> posting() async {
    PhoneModel model = PhoneModel(
      name: namecontroller.text,
      startTime: starttimecontroller.text,
      endTime: endtimecontroller.text,
      date: datecontroller.text,
      phoneNumber: phonenumbetcontroller.text,
    );
    PhoneModelService().savePhoneModel(model);
  }

  Future<void> getting() async {
    final List<Datum> response =
        await PhoneService().getData(phonenumbetcontroller.text);
    if (response != null) {
      log('enetering');
      setState(() {
        userDetails.addAll(response);
      });
      log("my list= ${userDetails.toString()}");
    }
  }
}
