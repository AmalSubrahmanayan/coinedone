import 'package:coinedone/constants/colors/app_colors.dart';
import 'package:coinedone/view/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
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
                            text: const TextSpan(
                              text: '6:00 AM - 7:00 AM\n',
                              style: TextStyle(
                                color: AppColors.blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Morning routine',
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
                  itemCount: 5,
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
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MapPage()),
                // );
              },
              child: const Icon(Icons.add),
            ),
          ),
          //   Positioned(
          //     left: 320,
          //     top: 420,
          //     child: FloatingActionButton(
          //       onPressed: () {},
          //       child: Icon(
          //         Icons.add,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
