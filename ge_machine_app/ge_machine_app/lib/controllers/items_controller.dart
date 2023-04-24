import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  int plasticItems = 0;
  int cansItems = 0;
  int points = 0;

  void increamentPlastic() {
    plasticItems++;
    update();
  }

  void increamentCans() {
    cansItems++;
    update();
  }

  void resetItems() {
    plasticItems = 0;
    cansItems = 0;
    points = 0;
  }

}
