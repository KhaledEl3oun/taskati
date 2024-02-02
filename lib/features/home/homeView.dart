import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/app_color.dart';
import 'package:taskati/core/custom_button.dart';
import 'package:taskati/core/text_style.dart';
import 'package:intl/intl.dart';
import 'package:taskati/features/addTask/addTask.dart';

class homeVeiw extends StatefulWidget {
  const homeVeiw({super.key});

  @override
  State<homeVeiw> createState() => _homeVeiwState();
}

class _homeVeiwState extends State<homeVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              headerWidget(),
              Gap(20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: getTitleStyle(),
                      ),
                      Text(
                        'Today',
                        style: getTitleStyle(),
                      )
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                      width: 148,
                      child: customButton(
                          text: '+ Add Task',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => addTask(),
                            ));
                          }))
                ],
              ),
              Gap(20),
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: appColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              Gap(20),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: appColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flutter Task - 1',
                                    style: getBodyStyle(
                                        color: appColors.whiteColor),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: appColors.whiteColor,
                                      ),
                                      Gap(10),
                                      Text(
                                        '02:25 AM - 02:40',
                                        style: getSmallStyle(
                                            color: appColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'I Will Do This Task',
                                    style: getSmallStyle(
                                        color: appColors.whiteColor),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 80,
                                width: .5,
                                color: appColors.whiteColor,
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'TODO',
                                  style: getBodyStyle(
                                      color: appColors.whiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(7);
                    },
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class headerWidget extends StatelessWidget {
  const headerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Sayed',
              style: getTitleStyle(color: appColors.primaryColor),
            ),
            Text(
              'Have A Nice Day.',
              style: getBodyStyle(color: appColors.blackColor),
            )
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 32,
          backgroundColor: appColors.primaryColor,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/1.jpg'),
          ),
        )
      ],
    );
  }
}
