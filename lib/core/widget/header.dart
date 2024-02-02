import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/network/network.dart';
import 'package:taskati/core/text_style.dart';
import 'package:taskati/core/app_color.dart';

class headerWidget extends StatefulWidget {
  const headerWidget({
    super.key,
  });

  @override
  State<headerWidget> createState() => _headerWidgetState();
}

class _headerWidgetState extends State<headerWidget> {
  String? name;
  String? path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    path = appLocal.getCachData(appLocal.image_key);
    name = appLocal.getCachData(appLocal.name_key);
    print(
      name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
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
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : AssetImage('assets/1.jpg'),
          ),
        )
      ],
    );
  }
}
