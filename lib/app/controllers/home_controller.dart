import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;

  final List<Tab> tabs = [
    const Tab(text: 'Movies'),
    const Tab(text: 'TV Shows'),
  ];

  changeIndex(int index) {
    selectedTabIndex.value = index;
  }
}
