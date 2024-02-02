import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/app_color.dart';
import 'package:taskati/core/custom_button.dart';
import 'package:taskati/core/text_style.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  int colorIndex = 0;
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());

  String endTime =
      DateFormat('hh:mm p').format(DateTime.now().add(Duration(minutes: 15)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColors.whiteColor,
            )),
        title: Text(
          'Add Task',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleStyle(),
              ),
              Gap(7),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: 'Enter title here',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(15),
              Text(
                'Note',
                style: getTitleStyle(),
              ),
              Gap(7),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                    hintText: 'Enter note here',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(10),
              Text(
                'Date',
                style: getTitleStyle(),
              ),
              Gap(7),
              TextFormField(
                onTap: () {
                  showDateDailog();
                },
                readOnly: true,
                decoration: InputDecoration(
                    hintText: date,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.date_range_outlined)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: getTitleStyle(),
                        ),
                        Gap(7),
                        TextFormField(
                          readOnly: true,
                          onTap: () {
                            showStarttime();
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              hintText: startTime,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.watch_later_outlined)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: getTitleStyle(),
                        ),
                        Gap(7),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              hintText: endTime,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.watch_later_outlined)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                ],
              ),
              Gap(15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: getBodyStyle(
                            color: appColors.blackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndex = 0;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: appColors.primaryColor,
                              child: (colorIndex == 0)
                                  ? Icon(Icons.check)
                                  : SizedBox(),
                            ),
                          ),
                          Gap(5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndex = 1;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: appColors.redColor,
                              child: (colorIndex == 1)
                                  ? Icon(Icons.check)
                                  : SizedBox(),
                            ),
                          ),
                          Gap(5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndex = 2;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: appColors.orangColor,
                              child: (colorIndex == 2)
                                  ? Icon(Icons.check)
                                  : SizedBox(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 155,
                    height: 60,
                    child: customButton(
                      text: 'Create Task',
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDateDailog() async {
    var pickedTime = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2040));
    if (pickedTime != null) {
      setState(() {
        date = DateFormat.yMd().format(pickedTime);
      });
    }
  }

  showStarttime() async {
    var startTimePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (startTimePicked != null) {
      setState(() {
        startTime = startTimePicked.format(context);
        int startMin = startTimePicked.minute;
        endTime =
            startTimePicked.replacing(minute: startMin + 15).format(context);
      });
    }
  }
}
