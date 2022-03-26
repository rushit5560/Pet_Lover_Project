import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogScreenController extends GetxController {
  RxInt isMyBlogSelected = 0.obs;

  TextEditingController myBlogSearchFieldController = TextEditingController();
  TextEditingController publicBlogSearchFieldController = TextEditingController();
}