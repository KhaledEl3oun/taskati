import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/app_color.dart';
import 'package:taskati/core/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/custom_error.dart';
import 'package:taskati/core/network/network.dart';
import 'package:taskati/features/home/homeView.dart';

class upload extends StatefulWidget {
  const upload({super.key});

  @override
  State<upload> createState() => _uploadState();
}

String? path;
String name = '';

class _uploadState extends State<upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  appLocal.cachData(appLocal.image_key, path);
                  appLocal.cachData(appLocal.name_key, name);
                  appLocal.cachData(appLocal.isApload_key,true);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => homeVeiw(),
                  ));
                } else if (path == null && name.isNotEmpty) {
                  customError(context, 'Please upload your image');
                } else if (path != null && name.isEmpty) {
                  customError(context, 'Please enter your name');
                } else {
                  customError(
                      context, 'Please upload your image and enter your name');
                }
                ;
              },
              child: Text('Done'))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 93,
                  backgroundColor: appColors.primaryColor,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: path != null
                        ? FileImage(File(path!)) as ImageProvider
                        : AssetImage('assets/person.png'),
                  ),
                ),
                Gap(20),
                SizedBox(
                    height: 45,
                    width: 200,
                    child: customButton(
                        text: 'Upload From Camera',
                        onPressed: () {
                          uploadFromCamera();
                        })),
                Gap(7),
                SizedBox(
                    height: 45,
                    width: 200,
                    child: customButton(
                        text: 'Upload From Gallry',
                        onPressed: () {
                          uploadFromGallery();
                        })),
                Divider(
                  height: 50,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: appColors.primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: appColors.primaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: appColors.primaryColor)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: appColors.primaryColor))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
