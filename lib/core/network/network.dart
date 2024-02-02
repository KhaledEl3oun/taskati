import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class appLocal {
  static String image_key = 'image';
  static String name_key = 'name';
  static String isApload_key = 'isApload';
  static cachData(String key, value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  static dynamic getCachData(String key) {
    var box = Hive.box('user');
    return box.get(key);
  }
}
